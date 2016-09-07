# Este archivo sirve para correr código que te permita 
# rellenar tu base de datos con información. 
 def canonical_word(word)
    word.split('').sort.join.downcase
  end

File.open("words").each do |line|
  line.each_line do |word|
    canonical = canonical_word(word.chomp)
    new_word = Word.create(word: word.chomp, canonical: canonical)
  end
end
  puts "Finalizado SEED"
