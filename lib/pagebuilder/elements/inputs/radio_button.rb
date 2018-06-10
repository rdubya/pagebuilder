# frozen_string_literal: true

module PageBuilder
  module Elements
    module Inputs

      # Creates radio button nodes and adds some helper
      # methods for commonly used attributes
      class RadioButton < PageBuilder::Elements::Input

        def initialize(*args)
          super
          self.type = 'radio'
        end

      end
    end
  end
end
