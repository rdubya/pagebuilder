RSpec.describe PageBuilder::Elements::Basic do

  subject { described_class.new('testelement', Nokogiri::HTML::Document.new) }

  it { is_expected.to be_a Nokogiri::XML::Element }

  describe '#configure' do

    it 'sets the content of the element if provided' do
      tag_name = Faker::Lorem.word
      subject.configure("<#{tag_name}>")
      expect(subject.content).to eq "<#{tag_name}>"
      expect(subject.to_html).to eq "<testelement>&lt;#{tag_name}&gt;</testelement>"
    end

    it 'sets attributes if passed in' do
      subject.configure(blah: 'x', foo: 'y', class: 'z')
      expect(subject['blah']).to eq 'x'
      expect(subject['class']).to eq 'z'
      expect(subject['foo']).to eq 'y'
    end

    it 'sets the content and the attributes if both are provided' do
      subject.configure('<blah>', blah: 'x', foo: 'y', class: 'z')
      expect(subject.content).to eq '<blah>'
      expect(subject.to_html).to include '&lt;blah&gt;'
      expect(subject['blah']).to eq 'x'
      expect(subject['class']).to eq 'z'
      expect(subject['foo']).to eq 'y'

    end

    it 'sets data attributes if provided' do
      data_attrs = { attr10: Faker::Lorem.word }
      expect(subject).to receive(:data_attributes=).with(data_attrs)
      subject.configure(blah: 'z', data: data_attrs)
      expect(subject['blah']).to eq 'z'
    end

  end

  describe '#data_attributes=' do

    it 'does nothing if an empty hash is passed in' do
      subject.data_attributes = {}
      subject.each do |attr_name, value|
        expect(attr_name.start_with?('data')).to be false
      end
    end

    it 'sets the specified data attributes when they are provided' do
      item_count = rand(1..5)
      attr_name = Faker::Lorem.word
      attrs = item_count.times.each_with_object({}) do |i, obj|
        obj["#{attr_name}#{i}"] = Faker::Lorem.word
      end
      subject.data_attributes = attrs
      attrs.each do |key, value|
        expect(subject["data-#{key}"]).to eq value
      end
    end

  end

end
