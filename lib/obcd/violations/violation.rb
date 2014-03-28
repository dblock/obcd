module Obcd
  module Violations
    class Violation
      attr_accessor :line, :description

      def initialize(line, description)
        @line = line
        @description = description
      end

      def to_s
        "line #{line}: #{description}"
      end
    end
  end
end
