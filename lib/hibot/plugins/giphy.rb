module Hibot
  class Giphy
    include Cinch::Plugin
    include API::Giphy

    match /gsearch/, method: :query

    def query(m)
      result = search(m.message)
      m.reply result
    end
  end
end