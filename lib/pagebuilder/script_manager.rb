# frozen_string_literal: true

module PageBuilder

  # Used to keep track of added/removed javascript
  # and to generate script tags in the correct order
  class ScriptManager
    extend Forwardable

    def initialize
      @index = []
      @scripts = {}
    end

    # Adds a script to be loaded if it doesn't exist
    # or updates stored tag attributes if it does
    # @param uri [String] the src of the script
    # @return [Boolean] true if script is added, false if uri already existed
    def add_script(uri, **attributes)
      uri_for_index = uri.downcase
      if attrs = @scripts[uri_for_index]
        attrs.merge!(attributes)
        false
      else
        attributes[:src] = uri
        @scripts[uri_for_index] = attributes
        @index << uri_for_index
        true
      end
    end

    # Creates the script tags requested in the correct order
    # @param [Nokogiri::XML::Node] node to append script tags to
    def append_tags(node)
      document = node.document
      @index.each do |i|
          node << Elements::Basic.new('script', document).configure(@scripts[i])
      end
    end

    # Removes a script that was previously added so that it won't be output
    # @param uri [String] the uri of the script to remove
    def remove_script(uri)
      uri_for_index = uri.downcase
      @index.delete(uri_for_index)
      @scripts.delete(uri_for_index)
    end
  end
end
