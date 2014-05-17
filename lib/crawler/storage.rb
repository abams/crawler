require 'redis'

module Crawler
  module Storage

    # Stores a path for the domain
    #
    def store_path(path)
      redis.sadd stored_paths_key, path
    end

    # Stores the static assets for a path
    #
    def store_path_assets(path, assets)
      return if assets.empty?
      redis.sadd path_assets_key(path), assets
    end

    # Stores paths that the current path links to
    #
    def store_path_links_to(path, links)
      return if links.empty?
      redis.sadd path_links_to_key(path), links
    end

    # Stores paths that link to the current path
    #
    def store_path_linked_to_from(path, links)
      return if links.empty?
      redis.sadd path_linked_to_from_key(path), links
    end

    # Stores paths that have been indexed for a domain
    #
    def store_path_visited(path)
      redis.sadd paths_visited_key, path
    end

    # Stores paths that need to be visited for a domain
    #
    def store_paths_to_visit(paths)
      return if paths.empty?
      redis.sadd paths_to_visit_key, paths
    end

    # Removes a path from paths that need to be visited
    #
    def remove_path_from_queue(path)
      redis.srem paths_to_visit_key, path
    end

    # Returns known paths for domain
    #
    def get_stored_paths
      redis.smembers stored_paths_key
    end

    # Returns paths that haven't been indexed
    #
    def get_paths_to_visit
      redis.smembers paths_to_visit_key
    end

    # Returns assets for a path
    #
    def get_path_assets(path)
      redis.smembers path_assets_key(path)
    end

    # Returns links that a path links to
    #
    def get_path_links_to(path)
      redis.smembers path_links_to_key(path)
    end

    # Returns links that link to a path
    #
    def get_path_linked_to_from(path)
      redis.smembers path_linked_to_from_key(path)
    end

    # Returns paths that have been indexed for a domain
    #
    def get_paths_visited
      redis.smembers paths_visited_key
    end

    # Returns paths and associated data for a domain
    #
    def get_domain_data
      get_stored_paths.inject({ 'domain' => base_uri.hostname, 'paths' => {}}) do |hsh, path|
        hsh['paths'][path] = get_path_data(path)
        hsh
      end
    end

    # Returns assets, links to, and links for a given path
    #
    def get_path_data(path)
      {
        'asset_dependencies' => get_path_assets(path),
        'links_to' => get_path_links_to(path),
        'linked_to_from' => get_path_linked_to_from(path)
      }
    end

    # Deletes all data for a domain
    #
    def clear_stored_results
      paths = get_stored_paths
      redis.pipelined do
        paths.each do |path|
          [stored_paths_key, paths_visited_key, paths_to_visit_key].each do |key|
            redis.del key
          end

          clear_path_results(path)
        end
      end
    end

    # Deletes all path data for a path
    #
    def clear_path_results(path)
      [path_assets_key(path), path_links_to_key(path), path_linked_to_from_key(path)].each do |key|
        redis.del key
      end
    end

    # Redis
    #
    def redis
      @redis ||= Redis.new
    end

    private

    def path_assets_key(path)
      "#{prefix}-path-assets-#{base_uri.hostname}-#{path}"
    end

    def path_links_to_key(path)
      "#{prefix}-path-links-to-#{base_uri.hostname}-#{path}"
    end

    def path_linked_to_from_key(path)
      "#{prefix}-path-linked-to-from-#{base_uri.hostname}-#{path}"
    end

    def stored_paths_key
      "#{prefix}-paths-#{base_uri.hostname}"
    end

    def paths_visited_key
      "#{prefix}-paths-visited-#{base_uri.hostname}"
    end

    def paths_to_visit_key
      "#{prefix}-queued-paths-#{base_uri.hostname}"
    end

    def prefix
      'crawler'
    end
  end
end
