# A method called make_snippet that takes a string as an argument and returns the first five words and then a '...' 
# if there are more than that.

require 'make_snippet'

RSpec.describe "make_snippet method" do
    it "returns first 5 words followed by '...' " do
    result = make_snippet("Once upon a time a long time ago")

    expect(result).to eq("Once upon a time a...")
    
    end

    it "returns whole string if fewer than 5 words" do
    result = make_snippet("Lived happily ever after")

    expect(result).to eq("Lived happily ever after")
    
    end

end