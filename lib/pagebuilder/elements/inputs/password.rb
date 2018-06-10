# frozen_string_literal: true

module PageBuilder
  module Elements
    module Inputs

      # Creates password input nodes
      class Password < PageBuilder::Elements::Input

        def initialize(*args)
          super
          self.type = 'password'
        end

      end
    end
  end
end
