# frozen_string_literal: true

module PageBuilder
  module Elements

    # Creates anchor nodes and adds some helper
    # methods for commonly used attributes
    class Input < Basic

      # We have to override #new because nokogiri creates
      # the nodes before calling initialize
      # @param parent_or_doc [Nokogiri::XML::Node, Nokogiri::XML::Document] something to pull the current document from
      def self.new(parent_or_doc)
        super('input', parent_or_doc)
      end

      # Gets the current type attribute's value
      # @return [String, nil]
      def type
        self['type']
      end

      # Sets the type attribute's value
      # @param type [String] the type of the input
      # @return void
      def type=(type)
        self['type'] = type
      end

      # Gets the current value attribute's value
      # @return [String, nil]
      def value
        self['value']
      end

      # Sets the value attribute's value
      # @param value [String] the value for this input
      # @return void
      def value=(value)
        self['value'] = value
      end
    end
  end
end
