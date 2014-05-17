module Crawler

  # Base Crawler Error
  #
  class Error < StandardError; end

  # Raised when invalid protocol is used
  #
  class InvalidProtocolError < Error; end
end
