# frozen_string_literal: true

module PageBuilder

  # Adds helper methods to the standard Nokogiri HTML document and
  # forces an html5 doctype
  class Document < Nokogiri::HTML::Document

    def self.new
      # This is the only way I've found so far to force the html5 doctype
      parse('<!DOCTYPE html><html><head></head><body></body></html>')
    end

    # Returns the base uri set for the document if there is one
    # @return [String|nil]
    def base_uri
      head.at('base')&.attr('href')
    end

    # Sets the base uri for the document, reuses the same <base> tag if one exists
    # @param uri [String]
    # @return [void]
    def base_uri=(uri)
      base_tag = head.at('base') || head.add_child(Elements::Basic.new('base', self))
      base_tag['href'] = uri
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
