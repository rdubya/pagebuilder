# frozen_string_literal: true

module PageBuilder

  # Adds helper methods to the standard Nokogiri HTML document and
  # forces an html5 doctype
  class Document < Nokogiri::HTML::Document

    # TODO Make helpers for more often used meta tags
    # TODO make helpers for more common link tags

    def self.new
      # This is the only way I've found so far to force the html5 subtype
      parse('<!DOCTYPE html><html><head></head><body></body></html>')
    end

    # Gets the body node for the document
    # @return [Nokogiri::XML::Node]
    def body
      @body ||= at('/html/body')
    end

    # Gets the head node for the document
    # @return [Nokogiri::XML::Node]
    def head
      @head ||= at('/html/head')
    end

  end

end
