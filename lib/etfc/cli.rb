require 'thor'
require 'etfc'

module ETFC
  class CLI < Thor
    desc 'collage [filename]', 'create a collage for keywords'
    long_desc <<-LONG
    ETFC is your friendly flickr collage creator.

    You give it a few keywords like 'butter', 'rick sanchez' and 'purpose';
    ETFC will then go and fetch the most interesting related pictures from
    flickr and create a collage of 5x2 images.  You can supply as many keywords
    as you wish, however only ten images will be displayed in the collage. If
    you supply less than ten words, random words will be taken from the
    dictionary.

    Example usage:

    etfc collage best_collage_ever.jpg --keywords=butter 'rick sanchez' purpose
    LONG
    option :keywords, type: :array, required: true
    def collage(result = 'collage.jpg')
      ETFC::Runner.run(options[:keywords], result)
    rescue SocketError, Timeout::Error, Errno::EINVAL, Errno::ECONNRESET,
           EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError,
           Net::ProtocolError, Errno::ECONNREFUSED
      puts 'There was a problem with the network connection. Please check ' \
           'your network and try again.'
      exit 1
    end
  end
end
