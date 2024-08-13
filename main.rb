require_relative 'lib/lobby'
require_relative 'lib/computer'
require_relative 'lib/player'

class Lobby
  def initialize
    puts 'Welcome to Mastermind!'
    player_start
  end

  def player_start
    start = ''
    until start == 'N'
      print 'would you like to play as codebreaker (B) or codemaster (M)?'
      start = gets.upcase.chomp
      player_game if start == 'B'
      computer_game if start == 'M'
    end
  end

  def player_game
    PlayerGame.new
  end

  def computer_game
    ComputerGame.new
  end

end


Lobby.new
