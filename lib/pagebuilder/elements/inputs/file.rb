# frozen_string_literal: true

module PageBuilder
  module Elements
    module Inputs

      # Creates file input nodes
      class File < PageBuilder::Elements::Input

        def initialize(*args)
          super
          self.type = 'file'
        end

      end
    end
  end
end
