def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    # p "key.chars.uniq is #{key.chars.uniq}"
    ciphertext_chars = plaintext.chars.map do |char|
      (65 + cipher.find_index(char)).chr
    end
    return ciphertext_chars.join
  end
  
  def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    # p "unique chars in key"
     p cipher
     p cipher[-12]
    # p "array a-z"
    # p ('a'..'z').to_a
    plaintext_chars = ciphertext.chars.map do |char|
      p (65 - char.ord)
      cipher[(65 - char.ord).abs]
    end
    return plaintext_chars.join
  end

# p encode("theswiftfoxjumpedoverthelazydog", "secretkey")
# p '"EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL" expected'

p decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
p '"theswiftfoxjumpedoverthelazydog" expected'