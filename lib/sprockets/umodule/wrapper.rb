require 'tilt'

module Sprockets
  module Umodule
    class Wrapper < Tilt::Template
      @wrapper_template = File.read(File.join(File.dirname(__FILE__), 'umodule.js.erb'))

      class << self
        attr_reader :wrapper_template

        def engine_initialized?
          defined?(ERB)
        end
      end

      def initialize_engine
        require 'erb'
      end

      def prepare
        @erb = ERB.new(wrapper_template)
      end

      def evaluate(context, locals, &block)
        bind(@erb).render(context.logical_path, data)
      end

      private

      def wrapper_template
        self.class.wrapper_template
      end

      def bind(erb)
        Class.new do
          def initialize(erb)
            @erb = erb
          end

          def render(module_name, source)
            @erb.result(binding)
          end
        end.new(erb)
      end
    end
  end
end
