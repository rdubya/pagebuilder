# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    # @!group Available Tags

    # @!visibility public
    def caption(content = nil, **attributes)
      pagebuilder_basic_element('caption', content, attributes)
    end

    # @!visibility public
    def col(**attributes)
      pagebuilder_basic_element('col', nil, attributes)
    end

    # @!visibility public
    def colgroup(**attributes)
      pagebuilder_basic_element('colgroup', nil, attributes)
    end

    # @!visibility public
    def table(**attributes)
      pagebuilder_basic_element('table', nil, attributes)
    end

    # TODO allow this to take an array of trs

    # @!visibility public
    def tbody(**attributes)
      pagebuilder_basic_element('tbody', nil, attributes)
    end

    # @!visibility public
    def td(content = nil, **attributes)
      pagebuilder_basic_element('td', content, attributes)
    end

    # @!visibility public
    def tfoot(**attributes)
      pagebuilder_basic_element('tfoot', nil, attributes)
    end

    # @!visibility public
    def th(content = nil, **attributes)
      pagebuilder_basic_element('th', content, attributes)
    end

    # @!visibility public
    def thead(**attributes)
      pagebuilder_basic_element('thead', nil, attributes)
    end

    # @!visibility public
    def tr(**attributes)
      pagebuilder_basic_element('tr', nil, attributes)
    end

    # @!endgroup Available Tags

  end
end
