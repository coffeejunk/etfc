require 'spec_helper'

describe ETFC::Dictionary do
  context '.random' do
    it 'returns a random word' do
      expect(ETFC::Dictionary.random).not_to be nil
    end

    it 'returns a random word without a system dictionary' do
      expect(File).to receive(:file?).and_return(false)
      expect(File).to receive(:file?).and_return(false)
      expect(ETFC::Dictionary.random).not_to be nil
    end
  end
end
