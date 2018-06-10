# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    # Helper for configuring a basic PageBuilder element
    def pagebuilder_basic_element(tag_name, content, **attributes)
      Elements::Basic.new(tag_name, pagebuilder_document).configure(content, attributes)
    end

    # Helper for configuring a PageBuilder element type
    def pagebuilder_configured_element(klass, content, **attributes)
      klass.new(pagebuilder_document).configure(content, attributes)
    end

    # Defaults to a new document set to the html5 doctype
    # unfortunately this is the only way I've found to be able to set the
    # doctype correctly
    def pagebuilder_document
      @pagebuilder_document ||= Nokogiri::HTML::Document.parse('<!DOCTYPE html>')
    end

    def pagebuilder_document=(doc)
      @pagebuilder_document = doc
    end

  end
end
