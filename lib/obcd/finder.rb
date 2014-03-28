module Obcd
  class Finder
    attr_reader :path

    def initialize(path)
      @path = File.expand_path(path)
      raise Errno::ENOENT.new(path) unless Dir.exists?(@path)
    end

    def find(&block)
      Find.find(path) do |path|
        if ['.h', '.m', '.pch'].include? File.extname(path)
          yield path
        end
      end
    end
  end
end
