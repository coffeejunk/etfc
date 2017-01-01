require 'open-uri'

module ETFC
  module Image
    module_function

    # Public: Download a file and save it to the temporary folder
    #
    # url  - URL of the file that shall be downloaded
    # name - name for the to be downloaded file
    #
    # Examples:
    #
    #   download('http://example.com/abc.jpg', '123.jpg')
    #   #=> "/var/tmp/111/222/123.jpg"
    #
    # Returns String with the location of the downloaded file
    def download(url, name)
      path = "#{ETFC::TMP_DIR}/#{name}"
      download = open(url)
      IO.copy_stream(download, path)
      path
    end
  end
end
