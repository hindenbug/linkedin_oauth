require 'oauth'
require 'json'
require 'mime/types'
module LinkedinOauth
  class Client

    OAUTH_OPTIONS = {
     :request_token_path => "/uas/oauth/requestToken",
     :access_token_path  => "/uas/oauth/accessToken",
     :authorize_path     => "/uas/oauth/authorize",
     :site               => "https://api.linkedin.com"}

    def initialize(opts={})
      @consumer_key       = opts[:consumer_key]
      @consumer_secret    = opts[:consumer_secret]
    end

    def access_token(options={})
      @access_token ||= OAuth::AccessToken.new(client, @oauth_token, @oauth_secret)
    end

    def request_token(options={})
      @request_token ||= client.get_request_token(:oauth_callback => options[:oauth_callback])
    end

    def authorize_request(rtoken, rsecret, options)
      request_token = OAuth::RequestToken.new(client, rtoken, rsecret)
      @access_token = request_token.get_access_token(options)
      @oauth_token  = access_token.token
      @oauth_secret = access_token.secret
    end

    def authorize_url
      client.authorize_url
    end

    def client
      @client ||= OAuth::Consumer.new(@consumer_key, @consumer_secret, OAUTH_OPTIONS)
    end
  end
end

