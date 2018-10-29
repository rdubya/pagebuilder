# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    # @!group Available Tags

    # @!visibility public
    def button(content = nil, **attributes)
      pagebuilder_basic_element('button', content, attributes)
    end

    # @!visibility public
    def checkbox(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Checkbox, nil, attributes)
    end

    # @!visibility public
    def email_input(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Email, nil, attributes)
    end

    # @!visibility public
    def fieldset(content = nil, **attributes)
      pagebuilder_basic_element('fieldset', content, attributes)
    end

    # @!visibility public
    def file_input(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::File, nil, attributes)
    end

    # @!visibility public
    def form(content = nil, **attributes)
      pagebuilder_basic_element('form', content, attributes)
    end

    # @!visibility public
    def hidden_input(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Hidden, nil, attributes)
    end

    # @!visibility public
    def input(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Input, nil, attributes)
    end

    # @!visibility public
    def keygen(**attributes)
      pagebuilder_basic_element('keygen', nil, attributes)
    end

    # TODO add helpers for things like labeled_input

    # @!visibility public
    def label(content = nil, **attributes)
      pagebuilder_basic_element('label', content, attributes)
    end

    # @!visibility public
    def legend(content = nil, **attributes)
      pagebuilder_basic_element('legend', content, attributes)
    end

    # TODO make optgroup take an array of options as the first argument

    # @!visibility public
    def optgroup(**attributes)
      pagebuilder_basic_element('optgroup', nil, attributes)
    end

    # @!visibility public
    def option(content = nil, **attributes)
      pagebuilder_basic_element('option', content, attributes)
    end

    # @!visibility public
    def password_input(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Password, nil, attributes)
    end

    # @!visibility public
    def radio_button(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::RadioButton, nil, attributes)
    end

    # @!visibility public
    def search_input(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Search, nil, attributes)
    end

    # TODO Make select take an array of options/optgroups

    # @!visibility public
    def select(**attributes)
      pagebuilder_basic_element('select', nil, attributes)
    end

    # @!visibility public
    def submit_button(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::SubmitButton, nil, attributes)
    end

    # @!visibility public
    def text_input(**attributes)
      pagebuilder_configured_element(PageBuilder::Elements::Inputs::Text, nil, attributes)
    end

    # @!visibility public
    def textarea(content = nil, **attributes)
      pagebuilder_basic_element('textarea', content, attributes)
    end

    # @!endgroup Available Tags

  end
end
