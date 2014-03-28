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
    end
  end
end

