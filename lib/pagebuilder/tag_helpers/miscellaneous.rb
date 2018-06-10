# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    # Define all helpers as private so they don't polute the
    # public method space for the class these are included in
    private

    def a(content = nil, **attributes)
      Elements::Anchor.new(pagebuilder_document).configure(content, attributes)
    end

    def base(content = nil, **attributes)
      pagebuilder_basic_element('base', content, attributes)
    end

    def body(content = nil, **attributes)
      pagebuilder_basic_element('body', content, attributes)
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

    def head(content = nil, **attributes)
      pagebuilder_basic_element('head', content, attributes)
    end

    def hr(content = nil, **attributes)
      pagebuilder_basic_element('hr', content, attributes)
    end

    def html(content = nil, **attributes)
      pagebuilder_basic_element('html', content, attributes)
    end

    # TODO make helpers for more common link tags
    def link(content = nil, **attributes)
      pagebuilder_basic_element('link', content, attributes)
    end

    def menu(content = nil, **attributes)
      pagebuilder_basic_element('menu', content, attributes)
    end

    def menuitem(content = nil, **attributes)
      pagebuilder_basic_element('menuitem', content, attributes)
    end

    # TODO Make helpers for more often used meta tags
    def meta(content = nil, **attributes)
      pagebuilder_basic_element('meta', content, attributes)
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
