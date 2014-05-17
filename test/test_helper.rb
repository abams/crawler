require 'rubygems'
require 'bundler'
Bundler.require :test

require 'simplecov'
SimpleCov.start do
  add_filter "/test/*_test.rb"
end

require 'redis'
require 'minitest/autorun'
require 'webmock/minitest'
require 'crawler'

# Support files
Dir["#{File.expand_path(File.dirname(__FILE__))}/support/*.rb"].each do |file|
  require file
end

class MiniTest::Test
  include DomainHtml

  def setup
    stub_request(:get, "https://www.digitalocean.com/").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => root_html , :headers => {})

    stub_request(:get, "https://www.digitalocean.com/redirect").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 301, :body => root_html , :headers => {'Location'=>'https://www.digitalocean.com'})

    stub_request(:get, "https://www.digitalocean.com/bad_request").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 404, :body => root_html , :headers => {})

    stub_request(:get, "https://www.digitalocean.com/pricing/").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => pricing_html , :headers => {})

    stub_request(:get, "https://www.digitalocean.com/features/").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => features_html , :headers => {})

    stub_request(:get, "https://www.digitalocean.com/company/careers/").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => careers_html , :headers => {})

    Redis.new.flushdb
  end
end
