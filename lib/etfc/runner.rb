module ETFC
  module Runner
    module_function

    # Public: create a collage of images found on flickr for a list of keywords
    #
    # keywords - array of keywords (up to 10)
    # output   - name of the resulting collage
    #
    # Example:
    #
    #  run(['banana', 'monkey'], 'collage.jpg')
    #  # the collage will be saved to collage.jpg in your current directory
    #
    # Returns Magick::ImageList; can be discarded as the collage will be saved
    # to the supplied file name on disk
    def run(keywords, output)
      images_urls = ten_img_urls(keywords)

      images_urls.each_with_index do |url, idx|
        Image.download(url, "#{idx}.jpg")
      end

      img_list = Dir[TMP_DIR + '/**.jpg']

      img_list.each { |img| Image.crop(img) }

      Collage.create(img_list, output)
    end

    # Public: get ten image urls for keywords; if less than 10 keywords are
    # supplied, random keywords will be selected from the system dictionary
    #
    # keywords - array of keywords (up to 10)
    #
    # Example:
    #
    #  ten_img_urls(['banana'])
    #  #=> ['http://example.com/123.jpog', '...]
    #
    # Returns an array of ten image URLs
    def ten_img_urls(keywords)
      images = keywords.map do |keyword|
        Flickr.search(keyword)
      end.reject(&:nil?)

      while images.length < 10
        result = Flickr.search(Dictionary.random)
        images << result unless result.nil?
      end

      images.take(10)
    end
  end
end
