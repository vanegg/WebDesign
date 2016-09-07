class Word < ActiveRecord::Base
  # Remember to create a migration!
  def self.find_anagrams(user_word)
    anagrams = []
    canon = Word.canonical_word(user_word)
    Word.where(canonical: canon).each do |words|
      anagrams << words.word
    end
    anagrams
  end

  def self.canonical_word(word)
    word.split('').sort.join.downcase
  end
end
