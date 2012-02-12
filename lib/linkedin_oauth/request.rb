 module LinkedinOauth
   module Request
     # Perform an HTTP GET request
	 def profile(options={})
	   if options[:id]
	     path = "people/#{options[:id]}"
	   elsif options[:url]
	   	 path = "people/#{options[:url]}"
	   else
	   	 path = "people/~"
	   end
	   request(:get, path, options)
	 end

   def connections(options={})
     if options[:id]
       path = "people/#{options[:id]}/connections"
     elsif options[:url]
       path = "people/#{options[:url]}/connections"
     else
       path = "people/~/connections"
     end
     request(:get, path, options)
   end

   # def companies(options={})
   #   if options[:id]
   #     path = "companies/#{options[:id]}"
   #   elsif options[:universal_name]
   #     path = "companies/universal-name=#{options[:universal_name]}"
   #   end
   #   request(:get, path, options)
   # end

    private

    DEFAULT_HEADERS = {
      'x-li-format' => 'json'
    }

    # Perform an HTTP request
    def request(method, path, options={})
      case method
      when :get
        response = access_token.get("/v1/#{path}", DEFAULT_HEADERS.merge(options))
        response.body
      end
    end

   end
end