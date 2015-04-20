#Hibot

## Presentation

Hibot is a bot written in Ruby and based on the excellent [cinch gem](https://github.com/cinchrb/cinch). The gem is developped using the plugins principle. You can just load the needed plugins and so you don't have to configure and to enable all plugins.

## Installation

Install the gem through rubygems. Use the basic command `gem install hibot`. Then you have to create a hibotrc yaml file that respects the following syntax :

```yaml
---
:general:
  :server: your.server.irc
  :channels:
  - '#channel1'
  - '#channel2'
  - ...
  :nick: your-bot-nick
  :plugins.plugins:
  - Hibot::Spotify
  - ... # see the plugin list below to see which plugins are available
```

**NOTE : ** The default hibotrc location is in your $HOME directory. So if you don't want to override the default behavior, just create a hidden .hibotrc file in your $HOME.

Then, just run the hibot binary to launch the bot. If you changed to default hibotrc location, you can use the -c or --config flag to specify where is your config file.

## Plugins

To use a plugin, first you have to add it to the hibotrc file. Then configure the plugin if some extra configuration is needed. Here is the plugin list and the instructions per plugin :

1. Hibot::Spotify : allows you to parse Spotify uri when pasted in a channel or to search through Spotify's API some data.

To use this plugin, you have to create a spotify application. You can do it from [here](https://developer.spotify.com/my-applications). When it's done, copy you client ID and client Secret to the hibotrc file with that structure : 

```yaml
---
# here comes the general configuration
:Hibot::Spotify:
  :client_id: your_client_id
  :client_secret: your_client_secret
```

2. Hibot::Giphy : allows you to get random gif uri matching your query

To use this plugin, you have to request an API key more information about how to get a key [here](https://github.com/giphy/GiphyAPI#access-and-api-keys). When you have your key, complete the hibotrc file with that structure : 

```yaml
:Hibot::Giphy:
  :api_key: your_api_key
```

## Contribute
1. Fork it
2. Dev it
3. Pull request it
4. Enjoy it