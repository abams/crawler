require 'nokogiri'
require 'crawler/http'
require 'crawler/formatting'

module Crawler
  module DocumentParser
    include Formatting
    include Http

    private

    # Parses the HTML from an http response
    #
    def parse_content(uri)
      Nokogiri::HTML request(uri)
    end

    # Returns the links from the html document
    #
    def extract_links
      content.css('a').map { |a| a['href'] unless a['href'] == '#' }.compact.uniq
    end

    # Returns the static assets from the html document
    #
    def extract_assets
      assets = content.css('img', 'script').map { |i| i['src'] }
      assets |= content.css('video').map { |v| v['poster'] }
      assets |= content.css('link').map { |l| l['href'] }

      assets.compact.uniq
    end

    # Returns the paths that are related to the given domain
    #
    def extract_domain_specific_paths
      links.map do |link|
        uri = Addressable::URI.parse(link.strip)
        if uri.hostname.nil? || uri.hostname == @uri.hostname
          normalize_path uri.path
        end
      end.compact
    end
  end
end
