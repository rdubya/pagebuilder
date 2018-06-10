# frozen_string_literal: true

module PageBuilder
  module Elements
    module Inputs

      # Creates text input nodes
      class Text < PageBuilder::Elements::Input

        def initialize(*args)
          super
          self.type = 'text'
        end

      end
    end
  end
end
