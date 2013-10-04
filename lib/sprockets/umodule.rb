require 'umodule-source'
require 'sprockets/umodule/version'
require 'sprockets/umodule/wrapper'
require 'sprockets/engines'

module Sprockets
  module Umodule
    class << self
      attr_accessor :options
    end

    @options = {}
  end

  register_engine '.umodule', Umodule::Wrapper
end
