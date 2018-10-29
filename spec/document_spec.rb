RSpec.describe PageBuilder::Document do

  it { is_expected.to be_a Nokogiri::HTML::Document }

  describe '::new' do

    it 'returns a document initialized with the html5 doctype and basic html page structure' do
      # JRuby adds a space in the doctype...
      expect(subject.to_html).to match "<!DOCTYPE html\s?>\n<html>"
      expect(subject.at('/html/head')).not_to be_nil
      expect(subject.at('/html/head/following-sibling::body')).not_to be_nil
    end

  end

  describe '#base_uri' do

    it 'returns the base uri for the document if one is set' do
      url = Faker::Internet.url
      subject.head << PageBuilder::Elements::Basic.new('base', subject).configure(href: url)
      expect(subject.base_uri).to eq url
    end

    it 'retruns nil by default and does not create a <base> tag' do
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

    it 'returns the body node' do
      test_node = subject.create_element(Faker::Lorem.word)
      subject.at('//body').add_child(test_node)
      expect(subject.body.name).to eq 'body'
      # JRuby apparently clones elements or something so it won't be the same instance
      expect(subject.body.children.first).to eq test_node
    end

    it 'caches the result' do
      expect(subject).to receive(:at).with('/html/body').once.and_call_original
      expect(subject.body).to be subject.body
    end

  end

  describe '#head' do

    it 'returns the head node' do
      test_node = subject.create_element(Faker::Lorem.word)
      subject.at('//head').add_child(test_node)
      expect(subject.head.name).to eq 'head'
      # JRuby apparently clones elements or something so it won't be the same instance
      expect(subject.head.children.first).to eq test_node
    end

    it 'caches the result' do
      expect(subject).to receive(:at).with('/html/head').once.and_call_original
      expect(subject.head).to be subject.head
    end

  end
end
