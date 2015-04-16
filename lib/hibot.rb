require 'cinch'

# plugins
require 'hibot/plugins/spotify'

class Hibot
  def initialize
    bot = Cinch::Bot.new do
      configure do |c|
        c.server = "irc.freenode.org"
        c.channels = ["#spotfibot"]
        c.plugins.plugins = [Spotify]
      end
    end

    bot.start
  end
end