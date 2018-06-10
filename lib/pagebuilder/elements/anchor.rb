# frozen_string_literal: true

module PageBuilder
  module Elements

    # Creates anchor nodes and adds some helper
    # methods for commonly used attributes
    class Anchor < Basic

      # We have to override #new because nokogiri creates
      # the nodes before calling initialize
      # @param parent_or_doc [Nokogiri::XML::Node, Nokogiri::XML::Document] something to pull the current document from
      def self.new(parent_or_doc)
        super('a', parent_or_doc)
      end

      # Gets the current href attribute's value
      # @return [String, nil]
      def href
        self['href']
      end

      # Sets the href attribute's value
      # @param url [String] the url to link to
      # @return void
      def href=(url)
        self['href'] = url
      end
    end
  end
end
