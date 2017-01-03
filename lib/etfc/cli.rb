require 'thor'
require 'etfc'

module ETFC
  class CLI < Thor
    desc 'collage', 'create a collage for keywords'
    long_desc <<-LONG
    LONG
    option :keywords, type: :array, required: true
    option :api_key,  type: :string
    option :secret,   type: :string
    def collage(result = 'collage.jpg')
      ETFC::Runner.run(options[:keywords], result)
    end
  end
end
