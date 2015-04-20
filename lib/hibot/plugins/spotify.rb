module Hibot
  class Spotify
    include Cinch::Plugin
    include API::Spotify

    match /ssearch/, {method: :query}
    match API::Spotify::URI_REGEX, {method: :parse, use_prefix: false}

    def query(m)
      result = search(m.message)
      m.reply result
    end

    def parse(m)
      parsed_uri = parse_uri(m.message)
      m.reply parsed_uri unless parsed_uri.nil?
    end
  end
end