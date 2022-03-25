require 'pry-byebug'
def caesar_cipher(string, cipher_offset)
  downcase_alphabet = {}
  for letter in 'a'..'z'
    downcase_alphabet[letter] = (downcase_alphabet.length + 1)
  end

  upcase_alphabet = {}
  for letter in 'A'..'Z' 
    upcase_alphabet[letter] = (upcase_alphabet.length + 79)
  end

  string_values = []
  string_array = string.split('')
  string_array.each do |letter|
    if is_upper?(letter)
      string_values.push(upcase_alphabet[letter])
    else 
      string_values.push(downcase_alphabet[letter])
    end
  end

  final_string_values = []
  final_string_values = string_values.map {|value| value + cipher_offset}
  
  output_numbers_array = []
  output_numbers_array = final_string_values.each do |value|
    if value ..0..52
      if value < 1
        value + 26
      elsif value > 26
        value - 26
      end
    else 
      if value < 79
        value + 26
      elsif value > 104
        value - 26
      end
    end
  end

  output_letters_array = []
  
end

def is_upper?(letter)
  letter == letter.upcase
end

caesar_cipher('hello', 5)