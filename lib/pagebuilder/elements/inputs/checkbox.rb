# frozen_string_literal: true

module PageBuilder
  module Elements
    module Inputs

      # Creates checkbox input nodes and adds some helper
      # methods for commonly used attributes
      class Checkbox < PageBuilder::Elements::Input

        def initialize(*args)
          super
          self.type = 'checkbox'
        end

      end
    end
  end
end
