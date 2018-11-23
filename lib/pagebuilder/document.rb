# frozen_string_literal: true

require 'pagebuilder/script_manager'

module PageBuilder

  # Adds helper methods to the standard Nokogiri HTML document and
  # forces an html5 doctype
  class Document < Nokogiri::HTML::Document
    extend Forwardable

    # @return [PageBuilder::Elements::Basic]
    attr_reader :body, :head

    # @!method add_script(uri, **attributes)
    #  @see ScriptManager#add_script
    # @!method remove_script(uri)
    #  @see ScriptManager#remove_script
    def_delegators :script_manager, :add_script, :remove_script

    def self.new
      # This is the only way I've found so far to force the html5 doctype
      parse('<!DOCTYPE html><html></html>')
    end

    def initialize(*)
      super
      @head = Elements::Basic.new('head', self)
      @body = Elements::Basic.new('body', self)
      at('/html') << @head << @body
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
      base_tag = @head.at('base') || @head.add_child(Elements::Basic.new('base', self))
      base_tag['href'] = uri
    end

    # Add managed nodes and then convert to html
    # @see Nokogiri::HTML::Document#to_html
    def to_html(*options)
      @script_manager.append_tags(@body) if @script_manager
      super
    end

    private

    def script_manager
      @script_manager ||= ScriptManager.new
    end

  end

end
