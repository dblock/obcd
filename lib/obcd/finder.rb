module Obcd
  class Finder
    attr_reader :path

    def initialize(path)
      @path = File.expand_path(path)
      fail Errno::ENOENT.new(path) unless File.exist?(@path) || Dir.exist?(@path)
    end

    def find(&block)
      if File.file?(path)
        yield path
      else
        Find.find(path) do |path|
          yield path if ['.h', '.m', '.pch'].include? File.extname(path)
        end
      end
    end
  end
end
