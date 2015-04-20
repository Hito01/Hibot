require 'yaml'

module Configuration
  def configure(opts)
    unless config_file_exists?(opts[:path])
      STDERR.puts Rainbow("Config file .hibotrc not found. Please ensure that it exists in your home directory or override the default location with the option corresponding.").red
      exit 1
    end

    config = read_config_file(opts[:path])
  end

  def config_file_exists?(path)
    File.exists?(path)
  end

  def read_config_file(path)
    config = YAML.load_file(path)
  end

  def configure_hibot_spotify(opts)
    opts.each {|opt, value|
      API::Spotify.class_variable_set("@@#{opt}", value)
    }
  end

  def configure_hibot_giphy(opts)
    opts.each {|opt, value|
      API::Giphy.class_variable_set("@@#{opt}", value)
    }
  end
end