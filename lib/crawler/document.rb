require 'crawler/document_parser'
require 'crawler/formatting'

module Crawler
  class Document
    include DocumentParser
    include Formatting

    attr_accessor :uri, :url, :content, :links, :domain_specific_paths, :static_assets

    # Intialize a new Document
    #
    # uri => uri of the document
    # url => url of the document
    # links => links found in the document
    # domain_specific_paths => paths in the document related to the crawler's base domain
    # static_assets => static_assets found in the document
    #
    def initialize(url)
      @uri = Addressable::URI.parse(url.strip)
      @url = construct_url uri
      @links = extract_links
      @domain_specific_paths = extract_domain_specific_paths
      @static_assets = extract_assets
    end

    # Nokogiri::HTML::Document
    #
    def content
      @content ||= parse_content uri
    end
  end
end
