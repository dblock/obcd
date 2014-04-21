require 'obcd/checks/check'
require 'obcd/checks/header_style'
require 'obcd/checks/specta_focus'

module Obcd
  module Checks
    def self.all
      [Obcd::Checks::HeaderStyle, Obcd::Checks::SpectaFocus]
    end
  end
end
