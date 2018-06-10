# frozen_string_literal: true

module PageBuilder
  module Elements
    module Inputs

      # Creates search input nodes
      class Search < PageBuilder::Elements::Input

        def initialize(*args)
          super
          self.type = 'search'
        end

      end
    end
  end
end
