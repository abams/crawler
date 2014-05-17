# Crawler

Crawler is a straightforward gem that will index a given domain, and store the results in redis.

## Installation

Add this line to your application's Gemfile:

    gem 'ruby-crawler'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby-crawler

## Usage

Crawl a given domain
```ruby
crawler = Crawler.new('http://domain.com')
crawler.crawl
```


View Results
```ruby
crawler.results
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/crawler/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
