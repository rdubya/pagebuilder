# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    # @!group Available Tags

    # @!visibility public
    def article(content = nil, **attributes)
      pagebuilder_basic_element('article', content, attributes)
    end

    # @!visibility public
    def aside(content = nil, **attributes)
      pagebuilder_basic_element('aside', content, attributes)
    end

    # @!visibility public
    def div(content = nil, **attributes)
      pagebuilder_basic_element('div', content, attributes)
    end

    # @!visibility public
    def footer(content = nil, **attributes)
      pagebuilder_basic_element('footer', content, attributes)
    end

    # @!visibility public
    def h1(content = nil, **attributes)
      pagebuilder_basic_element('h1', content, attributes)
    end

    # @!visibility public
    def h2(content = nil, **attributes)
      pagebuilder_basic_element('h2', content, attributes)
    end

    # @!visibility public
    def h3(content = nil, **attributes)
      pagebuilder_basic_element('h3', content, attributes)
    end

    # @!visibility public
    def h4(content = nil, **attributes)
      pagebuilder_basic_element('h4', content, attributes)
    end

    # @!visibility public
    def h5(content = nil, **attributes)
      pagebuilder_basic_element('h5', content, attributes)
    end

    # @!visibility public
    def h6(content = nil, **attributes)
      pagebuilder_basic_element('h6', content, attributes)
    end

    # @!visibility public
    def header(content = nil, **attributes)
      pagebuilder_basic_element('header', content, attributes)
    end

    # @!visibility public
    def hgroup(**attributes)
      pagebuilder_basic_element('hgroup', nil, attributes)
    end

    # @!visibility public
    def main(content = nil, **attributes)
      pagebuilder_basic_element('main', content, attributes)
    end

    # @!visibility public
    def nav(content = nil, **attributes)
      pagebuilder_basic_element('nav', content, attributes)
    end

    # @!visibility public
    def section(content = nil, **attributes)
      pagebuilder_basic_element('section', content, attributes)
    end

    # @!endgroup Available Tags

  end
end
