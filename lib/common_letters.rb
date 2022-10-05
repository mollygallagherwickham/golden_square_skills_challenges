def get_most_common_letter(text)
    counter = Hash.new(0)
    p counter
    p "text.chars is #{text.chars}"
    text.delete(" ").chars.each do |char|
      counter[char] += 1
    end
  #p "counter is #{counter}"
  
   counter.to_a.sort_by { |k, v| v }[-1][0]

  end

  p get_most_common_letter("hello Ella!")