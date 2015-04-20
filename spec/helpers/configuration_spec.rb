RSpec.describe Configuration do
  let(:obj) { Object.new.extend(Configuration) }
  let(:config_path) { File.expand_path("../../foo", __FILE__) }
  let(:create_file) { FileUtils.touch(config_path) }
  let(:delete_file) { FileUtils.remove_entry(config_path) }

  describe "check if the .hibotrc file exists" do
    it "should return false if it doesn't exist" do
      begin delete_file; rescue;end
      expect(obj.config_file_exists?(config_path)).to eq(false)
    end

    it "should return true if it exists" do
      create_file
      expect(obj.config_file_exists?(config_path)).to eq(true)
      delete_file
    end
  end

  describe "parse the config file" do
    before(:each) do create_file end
    after(:each) do delete_file end

    it "should return false if the file is empty" do
      expect(obj.read_config_file(config_path)).to eq(false)
    end

    it "should return a hash with all the settings if file is not empty" do
      File.open(config_path, 'w') {|f| f.write({foo: 'bar', hello: 'world'}.to_yaml)} 
      expect(obj.read_config_file(config_path)).to eq({foo: 'bar', hello: 'world'})
    end
  end

  describe "configure the gem" do
    it "should exit if the path provided is not a valid config file" do
      opts = {path: "/var/foo/bar"}
      expect { obj.configure(opts) }.to raise_error(SystemExit)
    end

    it "should return a hash with the settings contained in the config file" do
      opts = {path: config_path}
      File.open(config_path, 'w') {|f| f.write({foo: 'bar', hello: 'world'}.to_yaml)}
      expect(obj.configure(opts)).to eq({foo: 'bar', hello: 'world'})
    end
  end

  describe "configure the spotify plugin" do
    it "should create class variable for each options" do
      opts = {foo: "bar", bar: "foo"}
      obj.configure_hibot_spotify(opts)
      expect(API::Spotify.class_variable_defined?(:@@foo)).to eq(true)
      expect(API::Spotify.class_variable_get(:@@foo)).to eq('bar')
      expect(API::Spotify.class_variable_defined?(:@@bar)).to eq(true)
      expect(API::Spotify.class_variable_get(:@@bar)).to eq('foo')
    end
  end
end