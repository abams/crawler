require 'test_helper'

class HttpTest < MiniTest::Test
  include Crawler::Http

  def test_request
    domain = 'https://www.digitalocean.com'
    response = request domain
    assert_equal 'SSD Cloud Server, VPS Server, Simple Cloud Hosting | DigitalOcean', Nokogiri::HTML(response).css('title').text
  end

  def test_request_follows_redirect
    domain = 'https://www.digitalocean.com/redirect'
    response = request domain
    assert_equal 'SSD Cloud Server, VPS Server, Simple Cloud Hosting | DigitalOcean', Nokogiri::HTML(response).css('title').text
  end

  def test_bad_request_is_rescued
    domain = 'https://www.digitalocean.com/bad_request'
    response = request domain
    assert_equal '', response
  end
end
