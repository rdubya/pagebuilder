require 'bundler/setup'
require 'pagebuilder'
require 'faker'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

RSpec::Matchers.define :be_an_html_element do |name, attrs = {}|
  match do |node|
    node.name == name.to_s && attrs.all? { |attr, value| node[attr] == value }
  end
end
