RSpec.describe API::Spotify do
  let(:obj) { Object.new.extend(described_class) }

  before(:each) do
    config = Hibot.configure({path: File.expand_path("../../hibotrc", __FILE__)})
    Hibot.configure_hibot_spotify(config['Hibot::Spotify'.to_sym])
  end
  
  context "parse_uri method" do
    it "should return a result if the uri matches with some results" do
      expect(obj.parse_uri('spotify:track:0YQznyH9mJn6UTwWFHqy4b')).to eq('Nicolas Jaar - El Bandido')
    end

    it "should return a result if the uri matches with an artist" do
      expect(obj.parse_uri('spotify:artist:7dGJo4pcD2V6oG8kP0tJRR')).to eq('Eminem')
    end

    it "should return nil if the uri doesn't match with any results" do
      expect(obj.parse_uri('spotify:track:xxxxxxxxxxxxxxxxxx')).to eq(nil)
    end
  end

  context "search method" do
    it "should return an error message if the number of arguments is not equal to 2" do
      expect(obj.search('foo')).to eq('Invalid search request. You have to provide a valid type (artist, album or track) and then your query')
    end

    it "should return an error message if the type is not in the permitted types list" do
      expect(obj.search('foo query')).to eq('Bad request. Allowed types are album, artist and track.')
    end

    it "should return a string saying not found if the query doesn't return any results" do
      expect(obj.search('album foobartest')).to eq('Nothing found with that parameter.')
    end

    it "should return a string with maximum 5 results if the query matches to something" do
      expect(obj.search('track eminem')).to eq("1. 'Till I Collapse --> spotify:track:6yr8GiTHWvFfi4o6Q5ebdT --> https://open.spotify.com/track/6yr8GiTHWvFfi4o6Q5ebdT\n2. Lose Yourself - Soundtrack Version --> spotify:track:7w9bgPAmPTtrkt2v16QWvQ --> https://open.spotify.com/track/7w9bgPAmPTtrkt2v16QWvQ\n3. The Monster --> spotify:track:5U8hKxSaDXB8cVeLFQjvwx --> https://open.spotify.com/track/5U8hKxSaDXB8cVeLFQjvwx\n4. Mockingbird --> spotify:track:17baAghWcrewNOcc9dCewx --> https://open.spotify.com/track/17baAghWcrewNOcc9dCewx\n")
    end
  end
end