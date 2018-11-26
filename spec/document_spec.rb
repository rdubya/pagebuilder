RSpec.describe PageBuilder::Document do

  it { is_expected.to be_a Nokogiri::HTML::Document }

  it 'delegates #add_script and #remove_script to the script manager' do
    add_script_uri = Faker::Internet.url
    remove_script_uri = Faker::Internet.url
    script_manager = subject.send(:script_manager)
    expect(script_manager).to receive(:add_script).with(add_script_uri)
    expect(script_manager).to receive(:remove_script).with(remove_script_uri)

    subject.add_script(add_script_uri)
    subject.remove_script(remove_script_uri)
  end

  describe '::new' do

    it 'returns a document initialized with the html5 doctype and basic html page structure' do
      # JRuby adds a space in the doctype...
      expect(subject.to_html).to match "<!DOCTYPE html\s?>\n<html></html>"
    end

  end

  describe '#base_uri' do

    it 'returns the base uri for the document if one is set' do
      url = Faker::Internet.url
      subject.base_uri = url
      expect(subject.base_uri).to eq url
    end

    it 'returns nil by default and does not create a <base> tag' do
      expect(subject.base_uri).to be_nil
      expect(subject.head.at('base')).to be_nil
    end

  end

  describe '#base_uri=' do

    let(:url) { Faker::Internet.url }

    it 'sets the base uri on a new <base> tag if one does not already exist' do
      expect(subject.head.at('base')).to be_nil
      subject.base_uri = url
      expect(subject.base_uri).to eq url
      expect(subject.head.at('base')['href']).to eq url
    end

    it 'sets the base uri on the existing <base> tag if one exists' do
      subject.base_uri = Faker::Internet.url
      expect(subject.base_uri).to_not eq url
      subject.base_uri = url
      expect(subject.base_uri).to eq url
      base_tags = subject.head.xpath('base')
      expect(base_tags.size).to be 1
      expect(base_tags.first['href']).to eq url
    end

  end

  describe '#body' do

    it 'creates and returns the body node on the first call' do
      test_node = subject.create_element(Faker::Lorem.word)

      # This creates the head and body elements so it needs to happen before
      # trying to add the test node to it
      expect(subject.body.name).to eq 'body'
      p subject.to_html
      subject.at('/html/head/following-sibling::body').add_child(test_node)
      # JRuby apparently clones elements or something so it won't be the same instance
      expect(subject.body.children.first).to eq test_node
    end

    it 'caches the result' do
      expect(subject.body).not_to be_nil
      expect(subject.body).to be subject.body
    end

  end

  describe '#head' do

    it 'returns the head node' do
      test_node = subject.create_element(Faker::Lorem.word)

      # This creates the head element so needs to happen before the child test
      expect(subject.head.name).to eq 'head'
      subject.at('/html/head').add_child(test_node)
      # JRuby apparently clones elements or something so it won't be the same instance
      expect(subject.head.children.first).to eq test_node
    end

    it 'caches the result' do
      expect(subject.head).not_to be_nil
      expect(subject.head).to be subject.head
    end

  end

  describe '#to_html' do

    it 'does not contain any script nodes if none were added' do
      expect(subject.to_html).not_to include 'script'
    end

    it 'includes expected script tags if any were added' do
      script_uri = Faker::Internet.url
      subject.add_script(script_uri)
      expect(subject.to_html).to include %Q(<script src="#{script_uri}")
    end

  end
end
