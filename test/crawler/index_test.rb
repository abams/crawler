require 'test_helper'

class IndexTest < MiniTest::Test
  include Crawler::Formatting

  def test_initialization
    domain = 'https://www.digitalocean.com'
    index = Crawler::Index.new(Addressable::URI.parse(domain))

    expected_results = {
      'domain' => 'www.digitalocean.com',
      'paths' => {}
    }

    assert_equal expected_results, index.results
  end

  def test_document_consumption
    domain = "https://www.digitalocean.com"
    document = Crawler::Document.new(domain)
    uri = Addressable::URI.parse(domain)
    index = Crawler::Index.new(uri)
    index.consume_document uri.path, document

    # Test domain is correct
    assert_equal 'www.digitalocean.com', index.base_uri.hostname

    # Test that urls / links are properly recorded
    results = index.results

    ["/company/careers/", "/", "/pricing/"].each do |key|
      assert_includes results['paths'].keys, key
    end

    paths_to_visit = index.get_paths_to_visit
    ["/company/careers/", "/pricing/"].each do |path|
      assert_includes paths_to_visit, path
    end

    paths = index.get_stored_paths
    ["/"].each do |path|
      assert_includes paths, path
    end

    # Test that the assets are recorded
    assets = index.get_path_assets('/')
    ["/assets/images/techcrunch.png", "/assets/images/cover_create.jpg", "/assets/css/style.css"].each do |asset|
      assert_includes assets, asset
    end

    # Test the indexed results
    assert_equal expected_index_results, index.results
  end

  def expected_index_results
    {
      "domain" => "www.digitalocean.com",
      "paths" => {
        "/company/careers/" => {
          "asset_dependencies" => [],
          "links_to" => [],
          "linked_to_from" => ["/"]
        },
        "/pricing/" => {
          "asset_dependencies" => [],
          "links_to" => [],
          "linked_to_from"=>["/"]
        },
        "/" => {
          "asset_dependencies" => ["//use.typekit.net/wix0mlm.js", "/assets/css/style.css", "/assets/images/cover_create.jpg", "/assets/images/techcrunch.png"],
          "links_to" => ["/company/careers/", "/pricing/", "/"],
          "linked_to_from" => []
        }
      }
    }
  end

end
