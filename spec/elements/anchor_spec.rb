RSpec.describe PageBuilder::Elements::Anchor do

  subject { described_class.new(Nokogiri::HTML::Document.new) }

  it { is_expected.to be_a PageBuilder::Elements::Basic }

  it 'is named "a"' do
    expect(subject.name).to eq 'a'
  end

  describe 'href attribute' do

    let(:href) { "http://www.google.com/#{rand(1..100)}" }

    it 'can be set' do
      subject.href = href
      expect(subject['href']).to eq href
    end

    it 'can be read' do
      subject.href = href
      expect(subject.href).to eq href
    end

  end
end
