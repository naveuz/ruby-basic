vowels_array = ["а", "о", "у", "и", "е", "ы", "э", "ю", "я"]
vowels_hash = {}
index = 0

("а".."я").each do |char|
  index += 1
  vowels_hash[char] = index if vowels_array.include?(char)
end

print vowels_hash
