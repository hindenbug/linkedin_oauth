require "spec_helper"

describe "LinkedinOauth::Client" do

  let(:consumer) do
  	LinkedinOauth::Client.new(:consumer_key => "d3gwgd41i0mt", :consumer_secret =>  "BGdH3XUUhFuoMlB8")
  end

  describe "#client" do
  	let(:client) { consumer.client }
  	it "should return an OAuth consumer" do
  	  client.request_token_path.should eql "/uas/oauth/requestToken"
      client.access_token_path.should eql "/uas/oauth/accessToken"
      client.authorize_path.should eql "/uas/oauth/authorize"
      client.site.should eql "https://api.linkedin.com"
  	end
  end

  describe "#request_token" do
  	use_vcr_cassette :record => :new_episodes

    it "should return a request_token" do
      request_token = consumer.request_token(:oauth_callback => "http://127.0.0.1")
      request_token.should be_a_kind_of OAuth::RequestToken
      a_request(:post, "https://api.linkedin.com/uas/oauth/requestToken").should have_been_made.once
    end
  end

  describe "#authorize_request" do

  	use_vcr_cassette :record => :new_episodes#, :match_requests_on => [:uri, :method]

    let(:access_token) do
      consumer.authorize_request('rtoken', 'rsecret')
    end

    it "should return a valid access token" do
      access_token.should be_a_kind_of String
      a_request(:post, "https://api.linkedin.com/uas/oauth/accessToken").should have_been_made.once
    end
  end


end