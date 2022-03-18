`jekyll_context_inspector`
[![Gem Version](https://badge.fury.io/rb/jekyll_context_inspector.svg)](https://badge.fury.io/rb/jekyll_context_inspector)
===========

`jekyll_context_inspector` is a Jekyll tag plugin that displays lots of information from context for websites in development mode if `context_inspector: true` in `_config.yml`.


## Usage

```html
<p>{% context_inspector %}</p>
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jekyll_context_inspector'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install jekyll_context_inspector


## Additional Information
More information is available on
[Mike Slinn&rsquo;s website](https://www.mslinn.com/blog/2020/10/03/jekyll-plugins.html).


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

Install development dependencies like this:
```
$ BUNDLE_WITH="development" bundle install
```

To build and install this gem onto your local machine, run:
```shell
$ bundle exec rake install
jekyll_context_inspector 1.0.0 built to pkg/jekyll_context_inspector-0.1.0.gem.
jekyll_context_inspector (1.0.0) installed.

$ gem info jekyll_context_inspector

*** LOCAL GEMS ***

jekyll_context_inspector (1.0.0)
    Author: Mike Slinn
    Homepage:
    https://github.com/mslinn/jekyll_context_inspector
    License: MIT
    Installed at: /home/mslinn/.gems

    Generates Jekyll logger with colored output.
```

To release a new version,
  1. Update the version number in `version.rb`.
  2. Commit all changes to git; if you don't the next step might fail with an unexplainable error message.
  3. Run the following:
     ```shell
     $ bundle exec rake release
     ```
     The above creates a git tag for the version, commits the created tag,
     and pushes the new `.gem` file to [RubyGems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mslinn/jekyll_context_inspector.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
