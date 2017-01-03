# ETFC

ETFC is your friendly flickr collage creator. You give it a few keywords like
'butter', 'rick sanchez' and 'purpose'; ETFC will then go and fetch the most
interesting related pictures from flickr and create a collage of 5x2 images.

![Sample Collage](sample_collage.jpg)

## Prerequisites

### Software

ImageMagick needs to be installed, check http://www.imagemagick.org/ for
instructions.

Though not strictly necessary, the user is advised to ensure a [words
file](https://en.wikipedia.org/wiki/Words_(Unix)) is present.

### Flickr API Key

Flickr requires an API Key and Shared Secret for communication with their API,
unfortunately we can't distribute these with the source code and thus you will
have to go through their simple registration process to receive these. Simply
go to [Flickr's App Garden](https://www.flickr.com/services/apps/create) and
register an application of your own.

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

As mentioned under the [Prerequisites](#prerequisites), you will need an API
Key and Shared Secret. Place these as environment variables in your terminal
environment:

  $ export FLICKR_API_KEY=abcdef12341abcdef 
  $ export FLICKR_SHARED_SECRET=fedcba321 

### CLI usage

To create a collage use the following command:

  $ etfc collage best_collage_ever.jpg --keywords=butter 'rick sanchez' purpose

### API usage

You can use ETFC as a gem in your application and (re-)use it's functionality
for your own purposes. ETFC consist of several modules each serving a singular
purpose: 

- `ETFC::Flickr`     -> Flickr search
- `ETFC::Image`      -> Image download and cropping
- `ETFC::Collage`    -> Collage creation
- `ETFC::Dictionary` -> Random word selection from the (system) dictionary

Refer to the individual module's documentation for usage details, or have
a look at the `ETFC::Runner` on how to tie them all together.

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

