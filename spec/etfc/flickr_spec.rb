require 'spec_helper'

describe ETFC::Flickr do
  context '.search' do
    it 'returns URL for match' do
      VCR.use_cassette('flickr_search_match') do
        expect(ETFC::Flickr.search('match')).to match(/http/)
      end
    end

    it 'returns nil for no match' do
      VCR.use_cassette('flickr_search_no_match') do
        expect(ETFC::Flickr.search('13371717171717171634517293')).to be_nil
      end
    end
  end
end
