module Anagram
  extend self

  def read_text_file
    File.read("wl.txt").split(' ')
  end

  def sort_characters
    read_text_file.each_with_object(Hash.new []) do |word, hash|
      hash[word.chars.sort] += [word]
    end
  end

  def print_anagram
    sort_characters.each do |word, matching_words|
      puts matching_words.join ', ' if matching_words.length > 1
    end
    return nil
  end

  def print_nonanagram
    sort_characters.each do |word, matching_words|
      puts matching_words.join ', ' if matching_words.length == 1
    end
    return nil
  end
end
