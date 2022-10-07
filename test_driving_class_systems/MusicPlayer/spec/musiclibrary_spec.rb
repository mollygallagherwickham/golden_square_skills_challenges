require 'musiclibrary'

RSpec.describe MusicLibrary do
    it "creates new, empty library" do
        library = MusicLibrary.new
        expect(library.all).to eq []
    end
end