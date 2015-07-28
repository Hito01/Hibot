# vendor gems
require 'cinch'
require 'httparty'
require 'rainbow'

# custom classes
require 'hibot/helpers/configuration'
require 'api/spotify'
require 'api/giphy'
require 'hibot/plugins/spotify'
require 'hibot/plugins/giphy'


module Hibot
  extend Configuration
  def self.launch(opts)
    # Read the config file and get all the settings in the config hash
    config = self.configure(opts)
    bot = Cinch::Bot.new do
      configure do |c|
        # General bot settings such server, channels etc
        config[:general].each {|opt, value|
          c.send("#{opt}=".to_sym, value)  
        }

        # Load plugins
        c.plugins.plugins = []
        config[:general]['plugins.plugins'.to_sym].each do |plugin|
          c.plugins.plugins << Object.const_get(plugin)
        end
      end
      
      on :connect do |m|
        User('nickserv').send("IDENTIFY #{config[:general][:nick]} #{conf[:general][:pass]}")
      end
    end

    # Loop to configure each activated plugins
    config[:general]['plugins.plugins'.to_sym].each do |plugin|
      # Format the plugin name to call the appropriate configure method
      plugin_name = plugin.split('::').join('_').downcase
      self.send("configure_#{plugin_name}", config[plugin.to_sym])
    end

    bot.start
  end
end
