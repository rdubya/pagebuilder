RSpec.describe PageBuilder::Elements::Inputs::SubmitButton do

  subject { described_class.new(Nokogiri::HTML::Document.new) }

  it { is_expected.to be_a PageBuilder::Elements::Input }

  it 'is named "input" and has type "submit"' do
    expect(subject.name).to eq 'input'
    expect(subject.type).to eq 'submit'
  end

end
