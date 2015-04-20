module API
  module Giphy
    WS_URL = "http://api.giphy.com/v1/gifs/search"
    URI_REGEX = /spotify:([a-z]+):(\w+)/

    def search(query)
      puts "dans le seeeeaaartch !!!"
      query = query.gsub('!gsearch', '').strip
      # Check that parameters are correct or return the corresponding error
      return "Please provide something to search" if query.nil? || query == ""

      # Perform the search and return the result
      result = ""
      response = HTTParty.get("#{WS_URL}?q=#{URI.encode(query)}&api_key=#{@@api_key}")
      if response['data'] && response['data'].count > 0
        gif = response['data'].first
        result = "Check this : #{gif['url']}"
      else
        result = 'Nothing found with that parameter.'
      end
      result
    end
  end
end