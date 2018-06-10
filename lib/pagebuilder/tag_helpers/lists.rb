# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    def dd(content = nil, **attributes)
      pagebuilder_basic_element('dd', content, attributes)
    end

    def dl(content = nil, **attributes)
      pagebuilder_basic_element('dl', content, attributes)
    end

    def dt(content = nil, **attributes)
      pagebuilder_basic_element('dt', content, attributes)
    end

    def li(content = nil, **attributes)
      pagebuilder_basic_element('li', content, attributes)
    end

    def ol(content = nil, **attributes)
      pagebuilder_basic_element('ol', content, attributes)
    end

    def ul(content = nil, **attributes)
      pagebuilder_basic_element('ul', content, attributes)
    end

  end
end
