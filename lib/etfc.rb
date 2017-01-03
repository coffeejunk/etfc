require 'tmpdir'

module ETFC
  FLICKR_API_KEY = ENV['FLICKR_API_KEY']
  FLICKR_SHARED_SECRET = ENV['FLICKR_SHARED_SECRET']

  TMP_DIR = Dir.mktmpdir
end

require 'etfc/version'
require 'etfc/flickr'
require 'etfc/image'
require 'etfc/collage'
require 'etfc/dictionary'
require 'etfc/runner'
