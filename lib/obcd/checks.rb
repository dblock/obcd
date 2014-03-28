require 'obcd/checks/check'
require 'obcd/checks/header_style'

module Obcd
  module Checks
    def self.all
      [ Obcd::Checks::HeaderStyle ]
    end
  end
end
