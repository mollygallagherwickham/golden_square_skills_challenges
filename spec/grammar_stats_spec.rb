require "grammar_stats"

RSpec.describe GrammarStats do
    it "returns true as text starts with capital letter and ends with a full stop" do
        sentence = GrammarStats.new
        result = sentence.check("A whole new world.")
        expect(result).to eq true
    end

    it "returns false as first letter not capitalised" do
        sentence = GrammarStats.new
        result = sentence.check("a whole new world.")
        expect(result).to eq false
    end

    it "returns false as no full stop at end" do
        sentence = GrammarStats.new
        result = sentence.check("A whole new world")
        expect(result).to eq false
    end

    it "returns error as text is nil" do
        sentence = GrammarStats.new
        expect{sentence.check(nil)}.to raise_error "No text given."
    end
    
    it "returns error as text is empty" do
        sentence = GrammarStats.new
        expect{sentence.check("")}.to raise_error "No text given."
    end

    it "gives 50% on grammar checks" do
        percentage = GrammarStats.new
        percentage.check("A whole new world.")
        percentage.check("a whole new world.")
        percentage.check("A whole new world")
        percentage.check("A whole new world.")
        result = percentage.percentage_good
        expect(result).to eq "#{50.0}%"

    end
    

    it "gives 0% on grammar checks" do
        percentage = GrammarStats.new
        percentage.check("A whole new world")
        percentage.check("a whole new world.")
        percentage.check("A whole new world")
        percentage.check("A whole new world")
        result = percentage.percentage_good
        expect(result).to eq "#{0.0}%"

    end
end