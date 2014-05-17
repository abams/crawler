require 'test_helper'
require 'crawler/formatting'

class FormattingTest < MiniTest::Test
  include Crawler::Formatting

  def test_normalize_path
    path = '/'
    assert_equal '/', normalize_path(path)

    path = '/pricing'
    assert_equal '/pricing/', normalize_path(path)

    path = '/pricing/'
    assert_equal '/pricing/', normalize_path(path)
  end

  def test_construct_url
    url = 'https://www.digitalocean.com'
    uri = URI.parse(url)
    assert_equal url, construct_url(uri)
  end
end
