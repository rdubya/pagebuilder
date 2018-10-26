module PageBuilder
  module Elements

    # A wrapper for Nokogiri::XML::Element so that
    # we can add extra helpers
    class Basic < Nokogiri::XML::Element

      # Create a shorthand way to add multiple children and return the last one.
      # With helpers this could be `ul >> li >> a(href: 'example.com')`
      # (see Nokogiri::XML::Element#add_child)
      alias_method :>>, :add_child

      # Helper to easily set the content and attributes for this element
      # @param content [String] text for the content of the element
      # @param attributes [] keyword arguments for the attributes that should be set
      # @option data [Hash] data attributes that should be set
      # @return [self]
      def configure(content = nil, **attributes)
        self.content = content if content

        # Deal with helper attributes
        data_attrs = attributes.delete(:data)
        self.data_attributes = data_attrs if data_attrs

        # Set normal attributes
        attributes.each { |k, v| self[k] = v }

        self
      end

      # Helper to set data attributes as a single call instead of
      # an individual line for each attribute
      # @param attributes [Hash] data attributes that should be set (minus the "data-" prefix)
      # @return void
      def data_attributes=(attributes)
        attributes.each do |k, v|
          self["data-#{k}"] = v
        end
      end

    end
  end
end
