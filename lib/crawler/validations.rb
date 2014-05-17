module Crawler
  module Validations

    VALID_PROTOCOLS = ['http', 'https'].freeze

    # Validates protocol is http or https
    #
    def validate_protocol
      raise InvalidProtocolError.new('Please specify either http or https') unless VALID_PROTOCOLS.include? base_uri.scheme
    end
  end
end
