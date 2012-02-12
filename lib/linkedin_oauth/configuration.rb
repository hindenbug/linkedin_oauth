module LinkedinOauth
  module Configuration

    OPTION_KEYS = [ :consumer_key, :consumer_secret ]

  	# The consumer key if none is set
    DEFAULT_CONSUMER_KEY = nil

    # The consumer secret if none is set
    DEFAULT_CONSUMER_SECRET = nil

    DEFAULT_OAUTH_TOKEN = nil

    DEFAULT_OAUTH_TOKEN_SECRET = nil

    OAUTH_OPTIONS = {
     :request_token_path => "/uas/oauth/requestToken",
     :access_token_path => "/uas/oauth/accessToken",
     :authorize_path => "/uas/oauth/authorize",
     :site => "https://api.linkedin.com"
    }

    def configure
      yield self
    end

    def options
      Hash.new.tap do |options|
        OPTION_KEYS.each { |key| hash[key] = send(k) }
      end
    end

  end
end