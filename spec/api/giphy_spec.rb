RSpec.describe API::Giphy do
  let(:obj) { Object.new.extend(described_class) }

  before(:each) do
    config = Hibot.configure({path: File.expand_path("../../hibotrc", __FILE__)})
    Hibot.configure_hibot_giphy(config['Hibot::Giphy'.to_sym])
  end
  
  context "parse_uri method" do
    it "should return a message with an url if some gifs match the query" do
      expect(obj.search('funny cat')).to_not eq("Nothing found with that parameter.")
    end

    it "should return an error message if none gif is found with that query" do
      expect(obj.search('foobartest')).to eq("Nothing found with that parameter.")
    end
  end
end