# frozen_string_literal: true

module PageBuilder
  module Elements
    module Inputs

      # Creates email input nodes
      class Email < PageBuilder::Elements::Input

        def initialize(*args)
          super
          self.type = 'email'
        end

      end
    end
  end
end
