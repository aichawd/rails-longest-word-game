require 'date'
require 'json'
require 'open-uri'

class GamesController < ApplicationController

  def new
    @letters = []
    9.times do
      letter = ('A'..'Z').to_a.sample
      @letters.push(letter)
    end
    @start = DateTime.now
  end

  def score
    @end = DateTime.now
    @start = DateTime.parse(params['timestamp'])
    @time = @end.sec - @start.sec

    @word = params['word'].upcase
    @grid = params['letters'].split

    if !english(@word)
      @score = 0
      @message = "Sorry but #{@word} is not an english word"
    elsif !valid(@word, @grid)
      @score = 0
      @message = "#{@word} cannot be built out of #{@grid}"
    else

      @score = compute_score(@word, @time)
      @message = "Congrats! It took you #{@time} seconds to find #{@word}"
    end
  end

  private

  def english(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_test = URI.open(url).read
    word_hash = JSON.parse(word_test)
    word_hash['found']
  end

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

  def compute_score(word, time)
    score = (word.length * 10) - (time * 3)
    score
  end
end
