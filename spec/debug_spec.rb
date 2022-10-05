require 'debug'

RSpec.describe "say_hello method" do
    it "returns hello followed by name given" do
    result = say_hello("kay")
    expect(result).to eq "hello, kay"
    end
end