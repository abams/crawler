require 'test_helper'

class StorageTest < MiniTest::Test

  def test_store_path_and_stored_paths
    path = '/pricing/'
    index = Crawler::Index.new(Addressable::URI.parse('https://www.digitalocean.com'))
    index.store_path path
    assert_equal [path], index.get_stored_paths
  end

  def test_storing_path_assets
    path = '/pricing/'
    assets = ['asset1', 'asset2']
    index = Crawler::Index.new(Addressable::URI.parse('https://www.digitalocean.com'))
    index.store_path_assets(path, assets)

    stored_assets = index.get_path_assets(path)
    assets.each do |asset|
      assert_includes stored_assets, asset
    end
  end

  def test_storing_path_links_to
    path = '/pricing/'
    links = ['link1', 'link2']
    index = Crawler::Index.new(Addressable::URI.parse('https://www.digitalocean.com'))
    index.store_path_links_to(path, links)

    stored_links = index.get_path_links_to(path)

    links.each do |link|
      assert_includes stored_links, link
    end
  end

  def test_storing_path_linked_to_from
    path = '/pricing/'
    links = ['link1', 'link2']
    index = Crawler::Index.new(Addressable::URI.parse('https://www.digitalocean.com'))
    index.store_path_linked_to_from(path, links)

    stored_links = index.get_path_linked_to_from(path)
    links.each do |link|
      assert_includes stored_links, link
    end
  end

  def test_storing_paths_visited
    path = '/pricing/'
    index = Crawler::Index.new(Addressable::URI.parse('https://www.digitalocean.com'))
    index.store_path_visited(path)
    assert_equal [path], index.get_paths_visited
  end

  def test_queuing_paths
    paths = ['/pricing/', '/features/']
    index = Crawler::Index.new(Addressable::URI.parse('https://www.digitalocean.com'))
    index.store_paths_to_visit(paths)
    assert_equal paths.reverse, index.get_paths_to_visit
  end

  def test_get_domain_data
    path = '/pricing/'
    index = Crawler::Index.new(Addressable::URI.parse('https://www.digitalocean.com'))
    index.store_path path

    assets = ['asset1', 'asset2']
    index.store_path_assets(path, assets)

    links_to = ['link1', 'link2']
    index.store_path_links_to(path, links_to)

    linked_to_from = ['link3', 'link4']
    index.store_path_linked_to_from(path, linked_to_from)

    data = index.get_domain_data
    assert_equal 'www.digitalocean.com', data['domain']

    assets.each do |value|
      assert_includes data['paths']['/pricing/']['asset_dependencies'], value
    end

    links_to.each do |value|
      assert_includes data['paths']['/pricing/']['links_to'], value
    end

    linked_to_from.each do |value|
      assert_includes data['paths']['/pricing/']['linked_to_from'], value
    end
  end

  def test_get_path_data
    path = '/pricing/'
    index = Crawler::Index.new(Addressable::URI.parse('https://www.digitalocean.com'))
    index.store_path path

    assets = ['asset1', 'asset2']
    index.store_path_assets(path, assets)

    links_to = ['link1', 'link2']
    index.store_path_links_to(path, links_to)

    linked_to_from = ['link3', 'link4']
    index.store_path_linked_to_from(path, linked_to_from)

    data = index.get_path_data(path)

    assets.each do |value|
      assert_includes data['asset_dependencies'], value
    end

    links_to.each do |value|
      assert_includes data['links_to'], value
    end

    linked_to_from.each do |value|
      assert_includes data['linked_to_from'], value
    end
  end

  def test_clear_stored_data
    path = '/pricing/'
    index = Crawler::Index.new(Addressable::URI.parse('https://www.digitalocean.com'))
    index.store_path path

    assets = ['asset1', 'asset2']
    index.store_path_assets(path, assets)

    links_to = ['link1', 'link2']
    index.store_path_links_to(path, links_to)

    linked_to_from = ['link3', 'link4']
    index.store_path_linked_to_from(path, linked_to_from)

    index.clear_stored_results

    empty_results = {
      'asset_dependencies' => [],
      'links_to' => [],
      'linked_to_from' => []
    }

    assert_equal empty_results, index.get_path_data(path)
  end

end
