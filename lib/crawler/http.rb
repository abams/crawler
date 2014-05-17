require 'net/http'
require 'open-uri'

module Crawler
  module Http

    # Open URI HTTP request
    #
    def request(uri)
      begin
        open(uri)
      rescue
        ''
      end
    end
  end
end
