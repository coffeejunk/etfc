# ETFC

ETFC is your friendly flickr collage creator. You give it a few keywords like
'butter', 'rick sanchez' and 'purpose'; ETFC will then go and fetch the most
interesting related pictures from flickr and create a collage of 5x2 images.

![Sample Collage](sample_collage.jpg)

## Prerequisites

ImageMagick needs to be installed, check http://www.imagemagick.org/ for
instructions.

Though not strictly necessary, the user is advised to ensure a [words
file](https://en.wikipedia.org/wiki/Words_(Unix)) is present.

## Installation

You probably want to use ETFC from your command line, in order to do so simply
install the gem:

    $ gem install etfc

Alternatively you can use ETFC's functionality from your own application. Add
this line to your application's Gemfile:

```ruby
gem 'etfc'
```

And then execute:

    $ bundle

## Usage

tbd

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake spec` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/coffeejunk/etfc. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT
License](http://opensource.org/licenses/MIT).

