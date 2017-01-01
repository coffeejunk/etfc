require 'flickraw'

module ETFC
  module Flickr
    module_function

    # Flickr requires authentication for API interaction
    FlickRaw.api_key = ETFC::FLICKR_API_KEY
    FlickRaw.shared_secret = ETFC::FLICKR_SHARED_SECRET

    # Public: Search for the most interesting image on flickr for a keyword
    #
    # keyword - the keyword to search for
    #
    # Examples:
    #
    #   search('something interesting')
    #   #=> 'http://farm9.staticflickr.com/1234/11111111111_2222222222_b.jpg'
    #
    #   search('something that totally wont match')
    #   #=> nil
    #
    # Returns a String (URL) for an image or `nil` if no image was found
    def search(keyword)
      # See https://www.flickr.com/services/api/flickr.photos.search.html /
      # http://hanklords.github.io/flickraw/FlickRaw/Flickr/Photos.html#method-i-search
      results = flickr.photos.search(sort: 'interestingness-desc',
                                     text: keyword,
                                     page: 1,
                                     per_page: 1,
                                     media: 'photos',
                                     content_type: 1,
                                     extras: 'url_l')

      results.first['url_l'] if results.size > 0
    end
  end
end
