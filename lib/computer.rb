class Computer
  attr_accessor :code

  def initialize
    puts 'the computer has 9 rounds to guess the 4-digit code.'
    puts 'the code must be 4 digits, numbers 1-6.'
    puts 'the computer will use super AI to guess your code. You must let it know a) how many numbers are correct, and b) how many of those numbers are in the correct position.'
    puts ''
    puts 'enter a 4 digit code:'
    @code = []
    @correct_code = [0, 0, 0, 0]
    @computer_guess = []
    @correct = 0
    @turn_count = 0
    code_input
  end

  def code_input
    @code = gets.chomp.each_char.to_a
    @code.map!(&:to_i)
    puts "the code you have chosen is #{@code}"
    computer_init
  end

  def computer_init
    if @turn_count == 10
      lose
    else
      @computer_guess = Array.new(4) { Random.rand(1...6) }
      puts "computer guessed #{@computer_guess}"
      codemaster_input
    end
  end

  def codemaster_input
    if @code == @correct_code
      win
    else
      puts 'list which integer position ([0, 1, 2, 3]) the computer got right'
      @correct = gets.chomp.each_char.to_a
      @correct.map!(&:to_i)
      puts "#{@correct}"
      @turn_count += 1
      codecrunch
    end
  end

  # def check_win
  # if @code == @correct_code
  #   win
  # # elsif
  #   #absolutely no numbers are correct
  #   # computer_init
  # else
  #   codecrunch
  #  end
  # end

  def codecrunch
    for x in @correct do
      @correct_code[x] = @computer_guess[x]
    end
    puts "#{@correct_code}"
    computer_guess
  end

  def computer_guess
    puts 'computer guess now'
    win
  end

  def win
    puts 'computer wins!!'

    start = ''
    until start == 'N'
      print 'would you like to play another game? (Y/N)'
      start = gets.upcase.chomp
      new_game if start == 'Y'
    end
  end

  def lose
    puts 'computer lost!'
    start = ''
    until start == 'N'
      print 'would you like to play another game? (Y/N)'
      start = gets.upcase.chomp
      new_game if start == 'Y'
    end
  end

  def new_game
    Lobby.new
  end
end
