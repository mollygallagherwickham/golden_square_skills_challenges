class GrammarStats
    def initialize
      @checks_store = []
    end
  
    def check(text)
      fail "No text given." if text.nil? || text.empty?
      first_character = text.chars.first
      result = first_character.match?(first_character.upcase) && text.end_with?(".")
      @checks_store << result
      return result
    end
  
    def percentage_good
        no_checks = @checks_store.length
        total_true = @checks_store.count(true)
        decimal = total_true.to_f / no_checks.to_f
        return "#{decimal * 100}%"
    end
  end

