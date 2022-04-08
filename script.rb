def caesar_cipher(string, cipher_offset)
  alphabet = {}
  for letter in 'a'..'z'
    alphabet[letter] = (alphabet.length + 1)
  end

  for letter in 'A'..'Z' 
    alphabet[letter] = (alphabet.length + 75)
  end

  string_values = []
  string_array = string.split('',-1)
  string_array.each do |letter|
      string_values.push(alphabet[letter])  
  end

  string_values.pop
  space_index = []
  string_values.each_with_index do |value, index|
    if value == nil
      space_index.push(index)
    end
  end

  space_index.reverse!
  if space_index.length 
    space_index.each {|index| string_values.delete_at(index)}
  end
  
  final_string_values = []
  final_string_values = string_values.map {|value| value + cipher_offset}
  
  output_numbers_array = []
  output_numbers_array = final_string_values.map do |value|
    if value < 1
      value + 26
    elsif value > 26 && value < 53
      value - 26 
    elsif value < 101 && value > 52
      value + 26
    elsif value > 126
      value - 26
    else
      value
    end
  end
  
  output_letters_array = []
  output_letters_array = output_numbers_array.map do |number|
    alphabet.select {|k,v| v == number}
  end
  output_letters_array = output_letters_array.map do |hash|
    hash.keys
  end
  output_letters_array = output_letters_array.flatten.join
  space_index.reverse!.each {|value| output_letters_array.insert(value, ' ')}
  
  puts output_letters_array
end

caesar_cipher('secret message test', 1)