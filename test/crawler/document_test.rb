require 'test_helper'

class DocumentTest < MiniTest::Test

  def test_document_parsing
    document = Crawler::Document.new('https://www.digitalocean.com/')

    # Test link discovery
    ['http://techcrunch.com/article/', 'https://cloud.digitalocean.com/login', '/company/careers/'].each do |link|
      assert_includes document.links, link
    end

    # Test domain specific link discovery
    assert_includes document.domain_specific_paths, '/company/careers/'

    ['https://twitter.com/digitalocean', 'https://status.digitalocean.com/', '#'].each do |link|
      refute_includes document.domain_specific_paths, link
    end

    # Test assest discovery
    assert_includes document.static_assets, '/assets/images/techcrunch.png'
  end
end
