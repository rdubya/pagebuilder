# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    # TODO Make the containers (ol/ul) take arrays of list items

    private

    # @!group Available Tags

    # @!visibility public
    def dd(content = nil, **attributes)
      pagebuilder_basic_element('dd', content, attributes)
    end

    # @!visibility public
    def dl(**attributes)
      pagebuilder_basic_element('dl', nil, attributes)
    end

    # @!visibility public
    def dt(content = nil, **attributes)
      pagebuilder_basic_element('dt', content, attributes)
    end

    # @!visibility public
    def li(content = nil, **attributes)
      pagebuilder_basic_element('li', content, attributes)
    end

    # @!visibility public
    def ol(**attributes)
      pagebuilder_basic_element('ol', nil, attributes)
    end

    # @!visibility public
    def ul(**attributes)
      pagebuilder_basic_element('ul', nil, attributes)
    end

    # @!endgroup Available Tags

  end
end
