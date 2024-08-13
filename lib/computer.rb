
class ComputerGame
  attr_accessor :code
end
  initialize
    puts 'the computer has 9 rounds to guess the 4-digit code.'
    puts 'the code must be 4 digits, numbers 1-6.'
    puts "the computer will use super AI to guess your code. You must let it know a) how many numbers are correct, and b) how many of those numbers are in the correct position."
    puts ''
    puts 'enter a 4 digit code:'
    @code = []


  def code_input
    @code = gets.chomp
    puts 'the code you have chosen is #{@code}'
  end




Lobby.new
