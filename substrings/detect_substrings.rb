def substrings(text, dictionary)
  # remove all case of the text
  insensitive_text = text.downcase
  # initialize a Hash
  word_counter = Hash.new(0)

  # Check each word of dictionary
  dictionary.each do |word| 
    founded_subs = insensitive_text.scan(word)
    word_counter[word] = founded_subs.length unless founded_subs.length == 0
  end

  return word_counter
end
