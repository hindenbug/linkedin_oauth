require "rubygems"
require 'oauth'
require 'json'
require 'mime/types'
require "linkedin_oauth/configuration"
require "linkedin_oauth/request"

module LinkedinOauth

  class Client

    include Configuration
    include Request

    def initialize(opts={})
      Configuration::OPTION_KEYS.each do |key|
        instance_variable_set("@#{key}".to_sym, opts[key])
      end
    end

    def client
      @client ||= OAuth::Consumer.new(@consumer_key, @consumer_secret, Configuration::OAUTH_OPTIONS)
    end

    def request_token(options={})
      @request_token ||= client.get_request_token(options)
    end

    def authorize_request(rtoken, rsecret, options={})
      request_token = OAuth::RequestToken.new(client, rtoken, rsecret)
      @access_token = request_token.get_access_token(options)
      @oauth_token  = @access_token.token
      @oauth_secret = @access_token.secret
    end

    def access_token
      @access_token ||= OAuth::AccessToken.new(client, @oauth_token, @oauth_secret)
    end

    def authorize_from_access(atoken,asecret)
      @oauth_token, @oauth_secret = atoken, asecret
    end
  end
end
