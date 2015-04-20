module Hibot
  class Spotify
    include Cinch::Plugin
    include API::Spotify

    match "search", method: :search
    match API::Spotify::URI_REGEX, {method: :parse, use_prefix: false}

    def search(m)
      # Search on the message without !search and without any trailing spaces
      result = search(m.message.gsub('!search', '').split)
      m.reply result
    end

    def parse(m)
      parsed_uri = parse_uri(m.message)
      m.reply parsed_uri unless parsed_uri.nil?
    end
  end
end