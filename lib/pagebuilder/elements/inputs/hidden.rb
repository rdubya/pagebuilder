# frozen_string_literal: true

module PageBuilder
  module Elements
    module Inputs

      # Creates hidden input nodes
      class Hidden < PageBuilder::Elements::Input

        def initialize(*args)
          super
          self.type = 'hidden'
        end

      end
    end
  end
end
