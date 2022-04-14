WORD = 'apple'
GRID = ['E','V','A','P','P','L']

def valid(word, grid)
  word_arr = word.upcase.split(//)
  word_arr.each do |letter|
    if grid.index(letter)
      grid.delete_at(grid.index(letter))
    else
      return false
    end
  end
  word
end

puts valid(WORD,GRID)
puts valid('pear',GRID)
