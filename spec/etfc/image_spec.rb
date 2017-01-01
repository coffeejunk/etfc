require 'spec_helper'

describe ETFC::Image do
  context '.download' do
    it 'downloads an image' do
      VCR.use_cassette('download_blank_image') do
        url = 'https://upload.wikimedia.org/wikipedia/en/4/48/Blank.JPG'
        expect(ETFC::Image.download(url, 'blank.jpg')).to match(/blank.jpg/)
      end
    end

    it 'handles network errors'
    # retry on network first failure; raise and exit if it fails again
  end

  context '.crop' do
    it 'crops an image rectangularly' do
      result = ETFC::Image.crop('fixtures/images/1.jpg')
      expect(result.columns).to eq(result.rows)
    end

    it 'crops an image to a given size' do
      result = ETFC::Image.crop('fixtures/images/1.jpg', 200, 400)
      expect(result.columns).to eq(200)
      expect(result.rows).to eq(400)
    end
  end
end
