# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    def caption(content = nil, **attributes)
      pagebuilder_basic_element('caption', content, attributes)
    end

    def col(content = nil, **attributes)
      pagebuilder_basic_element('col', content, attributes)
    end

    def colgroup(content = nil, **attributes)
      pagebuilder_basic_element('colgroup', content, attributes)
    end

    def table(content = nil, **attributes)
      pagebuilder_basic_element('table', content, attributes)
    end

    def tbody(content = nil, **attributes)
      pagebuilder_basic_element('tbody', content, attributes)
    end

    def td(content = nil, **attributes)
      pagebuilder_basic_element('td', content, attributes)
    end

    def tfoot(content = nil, **attributes)
      pagebuilder_basic_element('tfoot', content, attributes)
    end

    def th(content = nil, **attributes)
      pagebuilder_basic_element('th', content, attributes)
    end

    def thead(content = nil, **attributes)
      pagebuilder_basic_element('thead', content, attributes)
    end

    def tr(content = nil, **attributes)
      pagebuilder_basic_element('tr', content, attributes)
    end

  end
end
