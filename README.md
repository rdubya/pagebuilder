# Pagebuilder

This gem provides helpers for building html pages. It uses the nokogiri gem to manage the page/DOM.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pagebuilder'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pagebuilder

## Usage

Include `PageBuilder::Tags` in the class where you want to build out pages. It will add helper methods for most HTML 5 tags. As an example, you can then call `a 'click here', href: 'http://www.example.com'` to generate an anchor node that links to `http://www.example.com` with "click here" as the text.

### Available helpers

There are some helpers added with the tags that are not directly related to element nodes. These are generally prefixed with `pagebuilder_` and are private except for the `to_html` method.

- `to_html` (public method)
  - It calls `to_html` on the document to generate the output
- `pagebuilder_document` and `pagebuilder_document=`
  - Read or set the Nokogiri HTML document that should be used for generating html nodes
  - If a document has not been set, an html5 doctyped Nokogiri Document will be created the first time it is called

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec`, or just `rspec`, to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rdubya/pagebuilder. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Pagebuilder project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rdubya/pagebuilder/blob/master/CODE_OF_CONDUCT.md).
