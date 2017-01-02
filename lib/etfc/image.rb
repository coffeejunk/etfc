require 'open-uri'
require 'rmagick'

module ETFC
  module Image
    module_function

    # Public: Download a file and save it to the temporary folder
    #
    # url  - URL of the file that shall be downloaded
    # name - name for the to be downloaded file
    #
    # Examples:
    #
    #   download('http://example.com/abc.jpg', '123.jpg')
    #   #=> "/var/tmp/111/222/123.jpg"
    #
    # Returns String with the location of the downloaded file
    def download(url, name)
      path = "#{ETFC::TMP_DIR}/#{name}"
      download = open(url)
      IO.copy_stream(download, path)
      path
    end

    # Public: Crop an image destructively
    #
    # image  - path of the image that shall be cropped
    # width  - OPTIONAL width,  defaults to 300
    # height - OPTIONAL height, defaults to 300
    #
    # Examples:
    #
    #  crop('/abc/123.jpg')
    #  #=> #<Magick::Image:70103481521220> => /abc/123.jpg JPEG
    #                      800x600=>300x300 800x600+250+150 DirectClass 8-bit
    #
    # Returns Magick::Image with the crop transformation queued
    def crop(image, width = 300, height = 300)
      img = Magick::Image.read(image)[0]
      img.crop!(Magick::CenterGravity, width, height)
      img.write(image)
    end
  end
end
