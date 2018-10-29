# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    # @!group Available Tags

    # @!visibility public
    def area(**attributes)
      pagebuilder_basic_element('area', nil, attributes)
    end

    # @!visibility public
    def audio(content = nil, **attributes)
      pagebuilder_basic_element('audio', content, attributes)
    end

    # @!visibility public
    def canvas(content = nil, **attributes)
      pagebuilder_basic_element('canvas', content, attributes)
    end

    # @!visibility public
    def embed(**attributes)
      pagebuilder_basic_element('embed', nil, attributes)
    end

    # @!visibility public
    def figcaption(content = nil, **attributes)
      pagebuilder_basic_element('figcaption', content, attributes)
    end

    # @!visibility public
    def figure(content = nil, **attributes)
      pagebuilder_basic_element('figure', content, attributes)
    end

    # @!visibility public
    def iframe(content = nil, **attributes)
      pagebuilder_basic_element('iframe', content, attributes)
    end

    # @!visibility public
    def img(**attributes)
      pagebuilder_basic_element('img', nil, attributes)
    end

    # @!visibility public
    def map(content = nil, **attributes)
      pagebuilder_basic_element('map', content, attributes)
    end

    # @!visibility public
    def object(content = nil, **attributes)
      pagebuilder_basic_element('object', content, attributes)
    end

    # @!visibility public
    def param(**attributes)
      pagebuilder_basic_element('param', nil, attributes)
    end

    # @!visibility public
    def source(**attributes)
      pagebuilder_basic_element('source', nil, attributes)
    end

    # @!visibility public
    def track(**attributes)
      pagebuilder_basic_element('track', nil, attributes)
    end

    # @!visibility public
    def video(content = nil, **attributes)
      pagebuilder_basic_element('video', content, attributes)
    end

    # @!endgroup Available Tags

  end
end
