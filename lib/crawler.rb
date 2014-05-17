require 'addressable/uri'
require 'crawler/document'
require 'crawler/error'
require 'crawler/formatting'
require 'crawler/index'
require 'crawler/validations'
require 'crawler/version'

module Crawler
  class << self
    include Formatting
    include Validations

    attr_accessor :base_uri, :base_url, :index

    # Initialize a new Crawler
    #
    # base_uri => base_uri to crawl
    # base_url => base_url to crawl
    #
    def new(domain)
      @base_uri = Addressable::URI.parse(domain.strip)
      validate_protocol

      @base_url = construct_url base_uri
      self
    end

    # Performs crawl of domain, indexes results
    #
    def crawl(url = base_url)
      document = Crawler::Document.new(url)
      index.consume_document url.sub(base_url, ''), document

      paths_queue = index.get_paths_to_visit
      next_path = paths_queue[0]

      print " Pages remaing - #{paths_queue.count}    \r"
      crawl "#{base_url}#{next_path}" if next_path
    end

    # Returns the indexed results of a crawl
    #
    def results
      index.results
    end

    private

    # Crawler::Index
    # New Index used to record results of domain crawl
    #
    def index
      @index ||= Crawler::Index.new(base_uri)
    end

  end

end
