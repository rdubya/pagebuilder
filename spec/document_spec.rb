RSpec.describe PageBuilder::Document do

  it { is_expected.to be_a Nokogiri::HTML::Document }

  describe '::new' do

    it 'returns a document initialized with the html5 doctype and basic html page structure' do
      expect(subject.to_html).to start_with "<!DOCTYPE html>\n<html>"
      expect(subject.at('/html/head')).not_to be_nil
      expect(subject.at('/html/head/following-sibling::body')).not_to be_nil
    end

  end

  describe '#body' do

    it 'returns the body node' do
      test_node = subject.create_element(Faker::Lorem.word)
      subject.at('//body').add_child(test_node)
      expect(subject.body.name).to eq 'body'
      expect(subject.body.children.first).to be test_node
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
      expect(subject.head.children.first).to be test_node
    end

    it 'caches the result' do
      expect(subject).to receive(:at).with('/html/head').once.and_call_original
      expect(subject.head).to be subject.head
    end

  end
end
