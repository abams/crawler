module Crawler
  module Formatting

    # normalize paths => '/path/to/'
    #
    def normalize_path(path)
      "#{path}/".gsub(/\/+/, '/')
    end

    # constructs a full url from a given uri object
    #
    def construct_url(uri)
      "#{uri.scheme}://#{uri.host}#{uri.path}"
    end
  end
end
