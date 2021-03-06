require 'spree_core'

require 'safe_yaml'
require 'tolk/config'
require 'spree_tolk/engine'
require 'tolk/sync'
require 'tolk/import'

module Tolk
  # Setup Tolk
  def self.config(&block)
    if block_given?
      block.call(Tolk::Config)
    else
      Tolk::Config
    end
  end
end


