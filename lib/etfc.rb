require 'tmpdir'

module ETFC
  FLICKR_API_KEY = 'API_KEY'.freeze
  FLICKR_SHARED_SECRET = 'SHARED_SECRET'.freeze

  TMP_DIR = Dir.mktmpdir
end

require 'etfc/version'
require 'etfc/flickr'
require 'etfc/image'
require 'etfc/collage'
require 'etfc/dictionary'
