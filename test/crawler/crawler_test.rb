require 'test_helper'

class CrawlerTest < MiniTest::Test

  def test_initialization
    crawler = Crawler.new('https://www.digitalocean.com')
    assert_equal 'www.digitalocean.com', crawler.base_uri.hostname
    assert_equal 'https://www.digitalocean.com', crawler.base_url
    assert_equal 'https', crawler.base_uri.scheme
  end

  def test_crawl
    crawler = Crawler.new('https://www.digitalocean.com')
    crawler.crawl
    results = crawler.results
    assert_equal expected_crawl_results, results
  end

  def expected_crawl_results
    {
      "domain" => "www.digitalocean.com",
      "paths" => {
        "/company/careers/" => {
          "asset_dependencies" => [],
          "links_to" => [],
          "linked_to_from" => ["/features/", "/pricing/", "/"]
        },
        "/" => {
          "asset_dependencies" => ["//use.typekit.net/wix0mlm.js", "/assets/css/style.css", "/assets/images/cover_create.jpg", "/assets/images/techcrunch.png"],
          "links_to" => ["/company/careers/",  "/pricing/", "/"],
          "linked_to_from" => ["/features/", "/pricing/"]
        },
        "/pricing/" => {
            "asset_dependencies" => ["/assets/css/style.css", "/assets/images/mashable.png"],
            "links_to" => ["/company/careers/", "/features/", "/"],
            "linked_to_from" => ["/features/", "/"]
        },
        "/features/" => {
          "asset_dependencies" => ["/assets/images/venturebeat.png"],
          "links_to" => ["/company/careers/", "/pricing/", "/"],
          "linked_to_from" => ["/pricing/"]
        }
      }
    }
  end
end
