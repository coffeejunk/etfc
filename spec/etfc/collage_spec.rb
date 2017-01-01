require 'spec_helper'

describe ETFC::Collage do
  context '.create' do
    after do
      File.delete('collage_spec.jpg')
    end

    it 'creates a collage of images' do
      imgs = Dir['fixtures/images/**.jpg']
      ETFC::Collage.create(imgs, 'collage_spec.jpg')
      result = Magick::Image.read('collage_spec.jpg')[0]
      expect(result.columns).to eq(1500)
      expect(result.rows).to eq(600)
    end
  end
end
