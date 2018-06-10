RSpec.describe PageBuilder::Elements::Inputs::Search do

  subject { described_class.new(Nokogiri::HTML::Document.new) }

  it { is_expected.to be_a PageBuilder::Elements::Input }

  it 'is named "input" and has type "search"' do
    expect(subject.name).to eq 'input'
    expect(subject.type).to eq 'search'
  end

end
