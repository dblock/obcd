module Obcd
  module Checks
    class SpectaFocus < Check
      def self.desc
        'Detect instances of focused specs.'
      end

      def check!
        File.open(filename).each_with_index do |line, lineno|
          matches = line.scan(/f(describe|context|example|it|specify) *?\( *?@"/)
          matches.each do |match|
            violations << Obcd::Violations::Violation.new(lineno + 1, "Unexpected f#{match[0]}(…) found.")
          end
        end
      end
    end
  end
end
