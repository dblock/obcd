module Obcd
  module Checks
    class Check
      attr_accessor :filename, :violations

      def initialize(filename)
        @filename = filename
        @violations = []
      end

      def check!
        # implement in a child class
      end

      def self.check(filename)
        instance = self.new(filename)
        instance.check!
        instance.violations
      end
    end
  end
end

