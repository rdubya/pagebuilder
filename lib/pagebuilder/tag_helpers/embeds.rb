# frozen_string_literal: true

module PageBuilder
  module TagHelpers

    private

    def area(content = nil, **attributes)
      pagebuilder_basic_element('area', content, attributes)
    end

    def audio(content = nil, **attributes)
      pagebuilder_basic_element('audio', content, attributes)
    end

    def canvas(content = nil, **attributes)
      pagebuilder_basic_element('canvas', content, attributes)
    end

    def embed(content = nil, **attributes)
      pagebuilder_basic_element('embed', content, attributes)
    end

    def figcaption(content = nil, **attributes)
      pagebuilder_basic_element('figcaption', content, attributes)
    end

    def figure(content = nil, **attributes)
      pagebuilder_basic_element('figure', content, attributes)
    end

    def iframe(content = nil, **attributes)
      pagebuilder_basic_element('iframe', content, attributes)
    end

    def img(content = nil, **attributes)
      pagebuilder_basic_element('img', content, attributes)
    end

    def map(content = nil, **attributes)
      pagebuilder_basic_element('map', content, attributes)
    end

    def object(content = nil, **attributes)
      pagebuilder_basic_element('object', content, attributes)
    end

    def param(content = nil, **attributes)
      pagebuilder_basic_element('param', content, attributes)
    end

    def source(content = nil, **attributes)
      pagebuilder_basic_element('source', content, attributes)
    end

    def track(content = nil, **attributes)
      pagebuilder_basic_element('track', content, attributes)
    end

    def video(content = nil, **attributes)
      pagebuilder_basic_element('video', content, attributes)
    end

  end
end
