# frozen_string_literal: true

require 'pagebuilder/script_manager'

module PageBuilder

  # Adds helper methods to the standard Nokogiri HTML document and
  # forces an html5 doctype.
  class Document < Nokogiri::HTML::Document
    extend Forwardable

    # @!method add_script(uri, **attributes)
    #  @see ScriptManager#add_script
    # @!method remove_script(uri)
    #  @see ScriptManager#remove_script
    def_delegators :script_manager, :add_script, :remove_script

    def self.new
      # This is the only way I've found so far to force the html5 doctype
      # It unfortunately also makes it so the initializer doesn't get called for JRuby
      parse('<!DOCTYPE html><html></html>')
    end

    # Returns the base uri set for the document if there is one
    # @return [String|nil]
    def base_uri
      @base&.attr('href')
    end

    # Sets the base uri for the document, reuses the same <base> tag if one exists
    # @param uri [String]
    # @return [void]
    def base_uri=(uri)
      @base ||= head.add_child(Elements::Basic.new('base', self))
      @base['href'] = uri
    end

    # Gets the body node for the document
    # @return [PageBuilder::Elements::Basic]
    def body
      @body ||= head.add_next_sibling(Elements::Basic.new('body', self))
    end

    # Gets the head node for the document
    # @return [PageBuilder::Elements::Basic]
    def head
      @head ||= at('/html').add_child(Elements::Basic.new('head', self))
    end

    # Add managed nodes and then convert to html
    # @see Nokogiri::HTML::Document#to_html
    def to_html(*options)
      @script_manager.append_tags(body) if @script_manager
      super
    end

    private

    def script_manager
      @script_manager ||= ScriptManager.new
    end

  end

end
