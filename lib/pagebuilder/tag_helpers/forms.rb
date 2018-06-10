# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    def button(content = nil, **attributes)
      pagebuilder_basic_element('button', content, attributes)
    end

    def checkbox(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Checkbox, content, attributes)
    end

    def email_input(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Email, content, attributes)
    end

    def fieldset(content = nil, **attributes)
      pagebuilder_basic_element('fieldset', content, attributes)
    end

    def file_input(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::File, content, attributes)
    end

    def form(content = nil, **attributes)
      pagebuilder_basic_element('form', content, attributes)
    end

    def hidden_input(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Hidden, content, attributes)
    end

    def input(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Input, content, attributes)
    end

    def keygen(content = nil, **attributes)
      pagebuilder_basic_element('keygen', content, attributes)
    end

    # TODO add helpers for things like labeled_input
    def label(content = nil, **attributes)
      pagebuilder_basic_element('label', content, attributes)
    end

    def legend(content = nil, **attributes)
      pagebuilder_basic_element('legend', content, attributes)
    end

    def optgroup(content = nil, **attributes)
      pagebuilder_basic_element('optgroup', content, attributes)
    end

    def option(content = nil, **attributes)
      pagebuilder_basic_element('option', content, attributes)
    end

    def password_input(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Password, content, attributes)
    end

    def radio_button(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::RadioButton, content, attributes)
    end

    def search_input(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Search, content, attributes)
    end

    def select(content = nil, **attributes)
      pagebuilder_basic_element('select', content, attributes)
    end

    def submit_button(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::SubmitButton, content, attributes)
    end

    def text_input(content = nil, **attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Text, content, attributes)
    end

    def textarea(content = nil, **attributes)
      pagebuilder_basic_element('textarea', content, attributes)
    end

  end
end
