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
end
