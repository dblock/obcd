=begin
Check that the header matches this:

//
//  FileName.h/m
//  Company
//
//  Created by Author on Date.
//  Copyright (c) Year Company. All rights reserved.
//

=end
module Obcd
  module Checks
    class HeaderStyle < Check
      def self.desc
        "Normalize header style on top of .m and .h files."
      end

      def check!
        if head.select { |line| line.start_with?("//") }.count != 7
          violations << Obcd::Violations::Violation.new(1, "Number of lines in header doesn't match.")
        elsif head.select { |line| (line.start_with?("//") || line.start_with?("//  ")) && ! line.start_with?("//   ") }.count != 7
          violations << Obcd::Violations::Violation.new(1, "Header text alignment or number of spaces in header doesn't match.")
        elsif head[7].strip != ""
          violations << Obcd::Violations::Violation.new(1, "Missing empty line after header.")
        else
          # opening
          violations << Obcd::Violations::Violation.new(1, "Expected header to start with a //.") unless head[0] == "//"
          # filename
          if head[1] != "//  #{File.basename(filename)}"
            if head[1].downcase == "//  #{File.basename(filename).downcase}"
              violations << Obcd::Violations::Violation.new(2, "Filename case doesn't match, expected #{File.basename(filename)}, got #{head[1]}.")
            elsif (extension = File.extname(head[1].split("//").last)) != File.extname(filename)
              violations << Obcd::Violations::Violation.new(2, "Filename extension doesn't match, expected #{File.extname(filename)}, got #{extension}.")
            else
              violations << Obcd::Violations::Violation.new(2, "Expected header to include file name, instead got #{head[1]}.") unless head[1] == "//  #{File.basename(filename)}"
            end
          end
          # TODO: check company
          # blank line
          violations << Obcd::Violations::Violation.new(4, "Expected a blank // after company name.") unless head[3] == "//"
          # TODO: created by
          # TODO: copyright
          violations << Obcd::Violations::Violation.new(7, "Expected a blank // after copyright.") unless head[3] == "//"
        end
      end

      private

      def head
        @head ||= begin
          open(filename) do |f|
            lines = []
            8.times do
              line = f.gets || break
              lines << line.chomp
            end
            lines
          end
        end
      end

    end
  end
end
