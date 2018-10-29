# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    # Define all helpers as private so they don't polute the
    # public method space for the class these are included in
    private

    # @!group Available Tags

    # @!visibility public
    def a(content = nil, **attributes)
      pagebuilder_configured_element(Elements::Anchor, content, attributes)
    end

    # @!visibility public
    def br(**attributes)
      pagebuilder_basic_element('br', nil, attributes)
    end

    # @!visibility public
    def datalist(content = nil, **attributes)
      pagebuilder_basic_element('datalist', content, attributes)
    end

    # @!visibility public
    def dialog(content = nil, **attributes)
      pagebuilder_basic_element('dialog', content, attributes)
    end

    # @!visibility public
    def hr(**attributes)
      pagebuilder_basic_element('hr', nil, attributes)
    end

    # @!visibility public
    def menu(content = nil, **attributes)
      pagebuilder_basic_element('menu', content, attributes)
    end

    # @!visibility public
    def noscript(content = nil, **attributes)
      pagebuilder_basic_element('noscript', content, attributes)
    end

    # @!visibility public
    def progress(content = nil, **attributes)
      pagebuilder_basic_element('progress', content, attributes)
    end

    # @!visibility public
    def script(content = nil, **attributes)
      pagebuilder_basic_element('script', content, attributes)
    end

    # @!visibility public
    def style(content = nil, **attributes)
      pagebuilder_basic_element('style', content, attributes)
    end

    # @!visibility public
    def template(content = nil, **attributes)
      pagebuilder_basic_element('template', content, attributes)
    end

    # @!endgroup Available Tags

  end
end
