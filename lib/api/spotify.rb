module API
  module Spotify
    WS_URL = "https://api.spotify.com/v1"
    PERMITTED_TYPES = %w{album artist track}
    URI_REGEX = /spotify:([a-z]+):(\w+)/

    def search(query)
      # Check that parameters are correct or return the corresponding error
      type, q = query.split(' ')
      return "Invalid search request. You have to provide a valid type (artist, album or track) and then your query" if type.nil? || q.nil?
      return "Bad request. Allowed types are album, artist and track." unless PERMITTED_TYPES.include?(type)

      # Perform the search and return the result
      result = ""
      response = HTTParty.get("#{WS_URL}/search?type=#{type}&q=#{URI.encode(q)}")
      if response["#{type}s"] && response["#{type}s"]['items'].count > 0
        i = 1
        response["#{type}s"]['items'].each do |item|
          result += "#{i}. #{item['name']} --> #{item['uri']} --> #{item['external_urls']['spotify']}\n"
          i += 1
          break if i == 5
        end
      else
        result = "Nothing found with that parameter."
      end
      result
    end

    def parse_uri(uri)
      matcher = uri.match(URI_REGEX)
      type = matcher[1]
      spotify_id = matcher[2]
      parsed_uri = nil
      response = HTTParty.get("#{WS_URL}/#{type}s/#{spotify_id}?client_id=#{@@client_id}")
      if response['name']
        if response['artists']
          parsed_uri = response['artists'][0]['name'] + " - " + response['name']
        else
          parsed_uri = response['name']
        end
      end
      parsed_uri
    end
  end
end