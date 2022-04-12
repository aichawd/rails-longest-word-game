class WordsController < ApplicationController

  def game
    @letters = []
    9.times do
      letter = ('A'..'Z').to_a.sample
      @letters.push(letter)
    end
  end

  def score
    
  end
end
