# frozen_string_literal: true

module PageBuilder
  module Elements
    module Inputs

      # Creates submit button nodes
      class SubmitButton < PageBuilder::Elements::Input

        def initialize(*args)
          super
          self.type = 'submit'
        end

      end
    end
  end
end
