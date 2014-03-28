module Obcd
  class Finder
    attr_reader :path

    def initialize(path)
      @path = File.expand_path(path)
      raise Errno::ENOENT.new(path) unless File.exists?(@path) || Dir.exists?(@path)
    end

    def find(&block)
      if File.file?(path)
        yield path
      else
        Find.find(path) do |path|
          if ['.h', '.m', '.pch'].include? File.extname(path)
            yield path
          end
        end
      end
    end
  end
end
