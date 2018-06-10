RSpec.describe PageBuilder::Elements::Input do

  subject { described_class.new(Nokogiri::HTML::Document.new) }

  it { is_expected.to be_a PageBuilder::Elements::Basic }

  it 'is named "input"' do
    expect(subject.name).to eq 'input'
  end

  describe 'type attribute' do

    let(:type) { Faker::Lorem.word }

    it 'can be set' do
      subject.type = type
      expect(subject['type']).to eq type
    end

    it 'can be read' do
      subject.type = type
      expect(subject.type).to eq type
    end

  end

  describe 'value attribute' do

    let(:value) { Faker::Lorem.word }

    it 'can be set' do
      subject.value = value
      expect(subject['value']).to eq value
    end

    it 'can be read' do
      subject.value = value
      expect(subject.value).to eq value
    end

  end
end
