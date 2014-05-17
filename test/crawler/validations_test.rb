require 'test_helper'

class ValidationsTest < MiniTest::Test

  def test_protocol_validation
    error = assert_raises(Crawler::InvalidProtocolError) { Crawler.new('digitalocean.com') }
    assert_equal 'Please specify either http or https', error.message
  end

end
