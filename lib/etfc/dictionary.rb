module ETFC
  class Dictionary
    def initialize
      init
    end

    # Private: Memorize 20 words from the system dictionary
    def init
      @words = dictionary.sample(20).map(&:strip)
    end

    # Public: Returns a random word
    #
    # Example:
    #
    #   random
    #   #=> 'mephitical'
    #
    # Returns a random word (String)
    def random
      init if @words.empty?

      @words.pop
    end

    # Private: Returns a dictionary
    #
    # Checks for a words file and fallsback to a minimal dictionary
    # https://en.wikipedia.org/wiki/Words_(Unix)
    def dictionary
      if File.file?('/usr/share/dict/words')
        words_file('/usr/share/dict/words')
      elsif File.file?('/usr/dict/words')
        words_file('/usr/dict/words')
      else
        %w(
          this is a jury rigged dictionary banana monkey apple pear peach
          computers are so great robot dance
        )
      end
    end

    # Private: Retrieve all 3 to 9 letter words from a provided file
    #
    # words - words file
    #
    # Example:
    #
    #  words_file('/usr/share/dict/words')
    #  #=> ['banana', ...]
    #
    # Retruns a list of words
    def words_file(words)
      File.read(words).lines.select do |l|
        (3..9).cover?(l.strip.size)
      end
    end
  end
end
