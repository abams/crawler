require 'crawler/formatting'
require 'crawler/storage'

module Crawler
  class Index
    include Formatting
    include Storage

    attr_accessor :base_uri

    # New Index to record paths for a given domain
    #
    def initialize(base_uri)
      @base_uri = base_uri
      clear_stored_results
    end

    # Ingests a Crawler::Document, stores all relevant data in redis
    # Updates pages that need to be visited as well as pages that have been visited already
    #
    def consume_document(path, document)
      path = normalize_path path
      new_links = document.domain_specific_paths.map { |path| normalize_path path }

      store_path path

      store_path_visited path

      store_path_assets path, document.static_assets

      store_path_links_to path, new_links

      store_paths_to_visit(new_links - get_paths_visited)

      remove_path_from_queue path

      update_paths_linked_to_from_path(document)
    end

    # Returns the data associated with an indexed domain
    #
    def results
      get_domain_data
    end

    private

    # Records incoming links for pages
    # Uses the current path as the incoming link
    # Records the current_path as incoming on all links found in the current document
    #
    def update_paths_linked_to_from_path(document)
      document.domain_specific_paths.each do |url|
        link_uri_path = normalize_path Addressable::URI.parse(url.strip).path
        document_uri_path = normalize_path document.uri.path
        next if link_uri_path == document_uri_path

        store_path link_uri_path
        store_path_linked_to_from(link_uri_path, [document_uri_path])
      end
    end
  end
end
