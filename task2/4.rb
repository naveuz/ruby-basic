vowels_array = ["а", "о", "у", "и", "е", "ы", "э", "ю", "я"]
vowels_hash = {}

("а".."я").each_with_index do |char, index|
  vowels_hash[char] = index + 1 if vowels_array.include?(char)
end

print vowels_hash
