require 'rmagick'

module ETFC
  module Collage
    module_function

    # Public: Creates a collage of 10 images in a 5x2 grid
    #
    # imgs   - array of 10 images (paths to the images)
    # output - name of the resulting collage
    #
    # Examples:
    #
    #  create(['1.jpg', '2.jpg', ...], 'collage.jpg')
    #  #=> 'Magick::ImageList...'
    #
    # Returns Magick::ImageList, can be discarded. The resulting collage will
    # be written to the provided file name.
    def create(imgs, output)
      list = Magick::ImageList.new
      imgs.each do |img|
        list << Magick::Image.read(img)[0]
      end

      # https://rmagick.github.io/ilist.html#montage
      montage = list.montage do
        self.geometry = Magick::Geometry.new(300, 300)
        self.tile = '5x2'
        self.stroke = 'transparent'
      end

      montage.write(output)
    end
  end
end
