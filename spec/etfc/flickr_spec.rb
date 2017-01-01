require 'spec_helper'

describe ETFC::Flickr do
  context '.search' do
    it { expect(ETFC::Flickr.search('match')).to match(/http/) }
    it { expect(ETFC::Flickr.search('13371717171717171634517293')).to be_nil }
  end
end
