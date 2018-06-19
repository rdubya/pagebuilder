# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    # Define all helpers as private so they don't polute the
    # public method space for the class these are included in
    private

    def a(content = nil, **attributes)
      pagebuilder_configured_element(Elements::Anchor, content, attributes)
    end

    def br(content = nil, **attributes)
      pagebuilder_basic_element('br', content, attributes)
    end

    def datalist(content = nil, **attributes)
      pagebuilder_basic_element('datalist', content, attributes)
    end

    def dialog(content = nil, **attributes)
      pagebuilder_basic_element('dialog', content, attributes)
    end

    def hr(content = nil, **attributes)
      pagebuilder_basic_element('hr', content, attributes)
    end

    def menu(content = nil, **attributes)
      pagebuilder_basic_element('menu', content, attributes)
    end

    def menuitem(content = nil, **attributes)
      pagebuilder_basic_element('menuitem', content, attributes)
    end

    def noscript(content = nil, **attributes)
      pagebuilder_basic_element('noscript', content, attributes)
    end

    def progress(content = nil, **attributes)
      pagebuilder_basic_element('progress', content, attributes)
    end

    def script(content = nil, **attributes)
      pagebuilder_basic_element('script', content, attributes)
    end

    def style(content = nil, **attributes)
      pagebuilder_basic_element('style', content, attributes)
    end

    def template(content = nil, **attributes)
      pagebuilder_basic_element('template', content, attributes)
    end

  end
end
