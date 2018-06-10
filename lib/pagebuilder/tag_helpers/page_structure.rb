# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    def article(content = nil, **attributes)
      pagebuilder_basic_element('article', content, attributes)
    end

    def aside(content = nil, **attributes)
      pagebuilder_basic_element('aside', content, attributes)
    end

    def div(content = nil, **attributes)
      pagebuilder_basic_element('div', content, attributes)
    end

    def footer(content = nil, **attributes)
      pagebuilder_basic_element('footer', content, attributes)
    end

    def h1(content = nil, **attributes)
      pagebuilder_basic_element('h1', content, attributes)
    end

    def h2(content = nil, **attributes)
      pagebuilder_basic_element('h2', content, attributes)
    end

    def h3(content = nil, **attributes)
      pagebuilder_basic_element('h3', content, attributes)
    end

    def h4(content = nil, **attributes)
      pagebuilder_basic_element('h4', content, attributes)
    end

    def h5(content = nil, **attributes)
      pagebuilder_basic_element('h5', content, attributes)
    end

    def h6(content = nil, **attributes)
      pagebuilder_basic_element('h6', content, attributes)
    end

    def header(content = nil, **attributes)
      pagebuilder_basic_element('header', content, attributes)
    end

    def hgroup(content = nil, **attributes)
      pagebuilder_basic_element('hgroup', content, attributes)
    end

    def main(content = nil, **attributes)
      pagebuilder_basic_element('main', content, attributes)
    end

    def nav(content = nil, **attributes)
      pagebuilder_basic_element('nav', content, attributes)
    end

    def section(content = nil, **attributes)
      pagebuilder_basic_element('section', content, attributes)
    end

  end
end
