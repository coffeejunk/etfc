require 'spec_helper'

describe ETFC::Runner do
  let(:keywords) { %w(banana monkey) }

  context '.run' do
    after do
      File.delete('collage_spec.jpg')
    end

    let(:output) { 'collage_spec.jpg' }
    it 'creates a collage' do
      VCR.use_cassette('collage') do
        ETFC::Runner.run(keywords, output)
      end

      result = Magick::Image.read('collage_spec.jpg')[0]
      expect(result.columns).to eq(1500)
      expect(result.rows).to eq(600)
    end
  end

  context '.ten_img_urls' do
    it 'finds ten image urls' do
      VCR.use_cassette('collage') do
        result = ETFC::Runner.ten_img_urls(keywords)
        expect(result.size).to be(10)
      end
    end

    it 'discards oversupply of keywords' do
      keywords = %w(this is a list of too many keywords they will the overflow
                    words will be used but only ten images are returned)
      VCR.use_cassette('ten_images') do
        result = ETFC::Runner.ten_img_urls(keywords)
        expect(result.size).to be(10)
      end
    end
  end
end
