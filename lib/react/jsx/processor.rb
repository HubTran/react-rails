module React
  module JSX
    module Processor
      VERSION = '1'

      def self.cache_key
        @cache_key ||= "#{name}:#{Autoload::Eco::Source::VERSION}:#{VERSION}".freeze
      end

      # Compile template data with JSX transformer.
      #
      # Returns a JS function definition String. The result should be
      # assigned to a JS variable.
      #
      #     # => "function(...) {...}"
      #
      def self.call(input)
        data = input[:data]
        input[:cache].fetch([cache_key, data]) do
          JSX::transform(data)
        end
      end
    end

  end
end
