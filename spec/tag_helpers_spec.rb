RSpec.describe PageBuilder::TagHelpers do

  class TestPresenter
    include PageBuilder::TagHelpers
  end

  let(:presenter) { TestPresenter.new }

  shared_examples 'a configured basic element' do |method_name, tag_name|

    tag_name ||= method_name.to_s

    it 'is an empty basic element named the same as the method' do
      element = presenter.send(method_name)
      expect(element).to be_a PageBuilder::Elements::Basic
      expect(element.name).to eq tag_name
      expect(element.children).to be_empty
      expect(element.text).to be_empty
    end

    it 'is configured with content if provided' do
      content = Faker::Lorem.sentence
      element = presenter.send(method_name, content)
      expect(element.text).to eq content
    end

    it 'is configured with content and attributes if provided' do
      attr_name = Faker::Lorem.word
      attr_value = Faker::Lorem.word
      content = Faker::Lorem.sentence
      element = presenter.send(method_name, content, attr_name.to_sym => attr_value)
      expect(element.text).to eq content
      expect(element[attr_name]).to eq attr_value
    end

    it 'is configured with provided attributes if content is not provided' do
      attr_name = Faker::Lorem.word
      attr_value = Faker::Lorem.word
      element = presenter.send(method_name, attr_name.to_sym => attr_value)
      expect(element.text).to be_empty
      expect(element[attr_name]).to eq attr_value
    end

  end

  describe '#pagebuilder_document' do

    it 'returns a new pagebuilder document and caches it' do
      expect(PageBuilder::Document).to receive(:new).once.and_call_original
      expect(presenter.send(:pagebuilder_document)).to be presenter.send(:pagebuilder_document)
    end

    it 'returns the set document if one was set' do
      doc = PageBuilder::Document.new
      expect(PageBuilder::Document).not_to receive(:new)
      presenter.send(:pagebuilder_document=, doc)
      expect(presenter.send(:pagebuilder_document)).to be doc
    end

  end

  describe '#to_html' do

    it 'is the only publicly defined method' do
      expect(presenter.methods - [:to_html]).to eq Object.new.methods
    end

    it 'returns the result of calling to_html on the document' do
      expected_output = Faker::Lorem.paragraph
      args = { indent: rand(0..5) }
      expect(presenter.send(:pagebuilder_document)).to receive(:to_html).with(args).and_return(expected_output)
      expect(presenter.to_html(args)).to eq expected_output
    end

  end

  context 'tag helpers' do

    describe '#a' do

      it_behaves_like 'a configured basic element', :a

      it 'creates an Anchor element' do
        a = presenter.send(:a)
        expect(a).to be_a PageBuilder::Elements::Anchor
        expect(a.href).to be_nil
        expect(a.text).to be_empty
        expect(a.children).to be_empty
      end

      it 'sets the href attribute if provided' do
        url = Faker::Internet.url
        a = presenter.send(:a, href: url)
        expect(a.href).to eq url
      end

    end

    describe '#abbr' do
      it_behaves_like 'a configured basic element', :abbr
    end

    describe '#address' do
      it_behaves_like 'a configured basic element', :address
    end

    describe '#area' do
      it_behaves_like 'a configured basic element', :area
    end

    describe '#article' do
      it_behaves_like 'a configured basic element', :article
    end

    describe '#aside' do
      it_behaves_like 'a configured basic element', :aside
    end

    describe '#audio' do
      it_behaves_like 'a configured basic element', :audio
    end

    describe '#b' do
      it_behaves_like 'a configured basic element', :b
    end

    describe '#base' do
      it_behaves_like 'a configured basic element', :base
    end

    describe '#bdi' do
      it_behaves_like 'a configured basic element', :bdi
    end

    describe '#bdo' do
      it_behaves_like 'a configured basic element', :bdo
    end

    describe '#blockquote' do
      it_behaves_like 'a configured basic element', :blockquote
    end

    describe '#br' do
      it_behaves_like 'a configured basic element', :br
    end

    describe '#button' do
      it_behaves_like 'a configured basic element', :button
    end

    describe '#canvas' do
      it_behaves_like 'a configured basic element', :canvas
    end

    describe '#caption' do
      it_behaves_like 'a configured basic element', :caption
    end

    describe '#checkbox' do

      it_behaves_like 'a configured basic element', :checkbox, 'input'

      it 'creates a Checkbox element' do
        input = presenter.send(:checkbox)
        expect(input).to be_a PageBuilder::Elements::Inputs::Checkbox
        expect(input.type).to eq 'checkbox'
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#cite' do
      it_behaves_like 'a configured basic element', :cite
    end

    describe '#code' do
      it_behaves_like 'a configured basic element', :code
    end

    describe '#col' do
      it_behaves_like 'a configured basic element', :col
    end

    describe '#colgroup' do
      it_behaves_like 'a configured basic element', :colgroup
    end

    describe '#data' do
      it_behaves_like 'a configured basic element', :data
    end

    describe '#datalist' do
      it_behaves_like 'a configured basic element', :datalist
    end

    describe '#dd' do
      it_behaves_like 'a configured basic element', :dd
    end

    describe '#del' do
      it_behaves_like 'a configured basic element', :del
    end

    describe '#details' do
      it_behaves_like 'a configured basic element', :details
    end

    describe '#dialog' do
      it_behaves_like 'a configured basic element', :dialog
    end

    describe '#dfn' do
      it_behaves_like 'a configured basic element', :dfn
    end

    describe '#div' do
      it_behaves_like 'a configured basic element', :div
    end

    describe '#dl' do
      it_behaves_like 'a configured basic element', :dl
    end

    describe '#dt' do
      it_behaves_like 'a configured basic element', :dt
    end

    describe '#em' do
      it_behaves_like 'a configured basic element', :em
    end

    describe '#email_input' do

      it_behaves_like 'a configured basic element', :email_input, 'input'

      it 'creates an Email element' do
        input = presenter.send(:email_input)
        expect(input).to be_a PageBuilder::Elements::Inputs::Email
        expect(input.type).to eq 'email'
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#embed' do
      it_behaves_like 'a configured basic element', :embed
    end

    describe '#fieldset' do
      it_behaves_like 'a configured basic element', :fieldset
    end

    describe '#figcaption' do
      it_behaves_like 'a configured basic element', :figcaption
    end

    describe '#figure' do
      it_behaves_like 'a configured basic element', :figure
    end

    describe '#file_input' do

      it_behaves_like 'a configured basic element', :file_input, 'input'

      it 'creates a File element' do
        input = presenter.send(:file_input)
        expect(input).to be_a PageBuilder::Elements::Inputs::File
        expect(input.type).to eq 'file'
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#footer' do
      it_behaves_like 'a configured basic element', :footer
    end

    describe '#form' do
      it_behaves_like 'a configured basic element', :form
    end

    describe '#h1' do
      it_behaves_like 'a configured basic element', :h1
    end

    describe '#h2' do
      it_behaves_like 'a configured basic element', :h2
    end

    describe '#h3' do
      it_behaves_like 'a configured basic element', :h3
    end

    describe '#h4' do
      it_behaves_like 'a configured basic element', :h4
    end

    describe '#h5' do
      it_behaves_like 'a configured basic element', :h5
    end

    describe '#h6' do
      it_behaves_like 'a configured basic element', :h6
    end

    describe '#header' do
      it_behaves_like 'a configured basic element', :header
    end

    describe '#hgroup' do
      it_behaves_like 'a configured basic element', :hgroup
    end

    describe '#hidden_input' do

      it_behaves_like 'a configured basic element', :hidden_input, 'input'

      it 'creates a Hidden element' do
        input = presenter.send(:hidden_input)
        expect(input).to be_a PageBuilder::Elements::Inputs::Hidden
        expect(input.type).to eq 'hidden'
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#hr' do
      it_behaves_like 'a configured basic element', :hr
    end

    describe '#i' do
      it_behaves_like 'a configured basic element', :i
    end

    describe '#iframe' do
      it_behaves_like 'a configured basic element', :iframe
    end

    describe '#img' do
      it_behaves_like 'a configured basic element', :img
    end

    describe '#input' do

      it_behaves_like 'a configured basic element', :input

      it 'creates an Input element' do
        input = presenter.send(:input)
        expect(input).to be_a PageBuilder::Elements::Input
        expect(input.type).to be_nil
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#ins' do
      it_behaves_like 'a configured basic element', :ins
    end

    describe '#kbd' do
      it_behaves_like 'a configured basic element', :kbd
    end

    describe '#keygen' do
      it_behaves_like 'a configured basic element', :keygen
    end

    describe '#label' do
      it_behaves_like 'a configured basic element', :label
    end

    describe '#legend' do
      it_behaves_like 'a configured basic element', :legend
    end

    describe '#li' do
      it_behaves_like 'a configured basic element', :li
    end

    describe '#link' do
      it_behaves_like 'a configured basic element', :link
    end

    describe '#main' do
      it_behaves_like 'a configured basic element', :main
    end

    describe '#map' do
      it_behaves_like 'a configured basic element', :map
    end

    describe '#mark' do
      it_behaves_like 'a configured basic element', :mark
    end

    describe '#menu' do
      it_behaves_like 'a configured basic element', :menu
    end

    describe '#menuitem' do
      it_behaves_like 'a configured basic element', :menuitem
    end

    describe '#meta' do
      it_behaves_like 'a configured basic element', :meta
    end

    describe '#meter' do
      it_behaves_like 'a configured basic element', :meter
    end

    describe '#nav' do
      it_behaves_like 'a configured basic element', :nav
    end

    describe '#noscript' do
      it_behaves_like 'a configured basic element', :noscript
    end

    describe '#object' do
      it_behaves_like 'a configured basic element', :object
    end

    describe '#ol' do
      it_behaves_like 'a configured basic element', :ol
    end

    describe '#optgroup' do
      it_behaves_like 'a configured basic element', :optgroup
    end

    describe '#option' do
      it_behaves_like 'a configured basic element', :option
    end

    describe '#output' do
      it_behaves_like 'a configured basic element', :output
    end

    describe '#p' do
      it_behaves_like 'a configured basic element', :p
    end

    describe '#param' do
      it_behaves_like 'a configured basic element', :param
    end

    describe '#password_input' do

      it_behaves_like 'a configured basic element', :password_input, 'input'

      it 'creates a Password element' do
        input = presenter.send(:password_input)
        expect(input).to be_a PageBuilder::Elements::Inputs::Password
        expect(input.type).to eq 'password'
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#pre' do
      it_behaves_like 'a configured basic element', :pre
    end

    describe '#progress' do
      it_behaves_like 'a configured basic element', :progress
    end

    describe '#q' do
      it_behaves_like 'a configured basic element', :q
    end

    describe '#radio_button' do

      it_behaves_like 'a configured basic element', :radio_button, 'input'

      it 'creates a RadioButton element' do
        input = presenter.send(:radio_button)
        expect(input).to be_a PageBuilder::Elements::Inputs::RadioButton
        expect(input.type).to eq 'radio'
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#rb' do
      it_behaves_like 'a configured basic element', :rb
    end

    describe '#rp' do
      it_behaves_like 'a configured basic element', :rp
    end

    describe '#rt' do
      it_behaves_like 'a configured basic element', :rt
    end

    describe '#rtc' do
      it_behaves_like 'a configured basic element', :rtc
    end

    describe '#ruby' do
      it_behaves_like 'a configured basic element', :ruby
    end

    describe '#s' do
      it_behaves_like 'a configured basic element', :s
    end

    describe '#samp' do
      it_behaves_like 'a configured basic element', :samp
    end

    describe '#script' do
      it_behaves_like 'a configured basic element', :script
    end

    describe '#search_input' do

      it_behaves_like 'a configured basic element', :search_input, 'input'

      it 'creates a Search element' do
        input = presenter.send(:search_input)
        expect(input).to be_a PageBuilder::Elements::Inputs::Search
        expect(input.type).to eq 'search'
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#section' do
      it_behaves_like 'a configured basic element', :section
    end

    describe '#select' do
      it_behaves_like 'a configured basic element', :select
    end

    describe '#small' do
      it_behaves_like 'a configured basic element', :small
    end

    describe '#source' do
      it_behaves_like 'a configured basic element', :source
    end

    describe '#span' do
      it_behaves_like 'a configured basic element', :span
    end

    describe '#strong' do
      it_behaves_like 'a configured basic element', :strong
    end

    describe '#style' do
      it_behaves_like 'a configured basic element', :style
    end

    describe '#sub' do
      it_behaves_like 'a configured basic element', :sub
    end

    describe '#submit_button' do

      it_behaves_like 'a configured basic element', :submit_button, 'input'

      it 'creates a SubmitButton element' do
        input = presenter.send(:submit_button)
        expect(input).to be_a PageBuilder::Elements::Inputs::SubmitButton
        expect(input.type).to eq 'submit'
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#summary' do
      it_behaves_like 'a configured basic element', :summary
    end

    describe '#sup' do
      it_behaves_like 'a configured basic element', :sup
    end

    describe '#table' do
      it_behaves_like 'a configured basic element', :table
    end

    describe '#tbody' do
      it_behaves_like 'a configured basic element', :tbody
    end

    describe '#td' do
      it_behaves_like 'a configured basic element', :td
    end

    describe '#template' do
      it_behaves_like 'a configured basic element', :template
    end

    describe '#text_input' do

      it_behaves_like 'a configured basic element', :text_input, 'input'

      it 'creates a Text element' do
        input = presenter.send(:text_input)
        expect(input).to be_a PageBuilder::Elements::Inputs::Text
        expect(input.type).to eq 'text'
        expect(input.text).to be_empty
        expect(input.children).to be_empty
      end

    end

    describe '#textarea' do
      it_behaves_like 'a configured basic element', :textarea
    end

    describe '#tfoot' do
      it_behaves_like 'a configured basic element', :tfoot
    end

    describe '#th' do
      it_behaves_like 'a configured basic element', :th
    end

    describe '#thead' do
      it_behaves_like 'a configured basic element', :thead
    end

    describe '#time' do
      it_behaves_like 'a configured basic element', :time
    end

    describe '#tr' do
      it_behaves_like 'a configured basic element', :tr
    end

    describe '#track' do
      it_behaves_like 'a configured basic element', :track
    end

    describe '#u' do
      it_behaves_like 'a configured basic element', :u
    end

    describe '#ul' do
      it_behaves_like 'a configured basic element', :ul
    end

    describe '#var' do
      it_behaves_like 'a configured basic element', :var
    end

    describe '#video' do
      it_behaves_like 'a configured basic element', :video
    end

    describe '#wbr' do
      it_behaves_like 'a configured basic element', :wbr
    end
  end
end
