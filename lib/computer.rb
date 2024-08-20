class Computer
  attr_accessor :code

  def initialize
    puts 'the computer has 9 rounds to guess the 4-digit code.'
    puts ''
    puts 'You must let the computer know what correct number they guessed.'
    puts ''
    puts 'enter a 4 digit code (numbers 1-6):'
    @code = []
    @correct_code = [0, 0, 0, 0]
    @allowed_code = [1, 2, 3, 4, 5, 6]
    @allowed_ints = [0, 1, 2, 3]
    @computer_guess = []
    @correct = 0
    @turn_count = 0
    code_input
  end

  def code_input
    @code = gets.chomp.each_char.to_a
    @code.map!(&:to_i)
    puts "the code you have chosen is #{@code}"
    code_check
  end

  def code_check
    if @code.length == 4 && @code.all? { |i| @allowed_code.include?(i) }

      
      computer_init

    else
      error
    end
  end

  def codemaster_input
    if @code == @correct_code
      win
    else

      puts 'list which integer position ([0, 1, 2, 3]) the computer got right? (hit enter if none)'
      @correct = gets.chomp.each_char.to_a
      @correct.map!(&:to_i)
      codemaster_check
    end
  end

  def computer_init
    if @turn_count == 10
      lose
    elsif @turn_count >= 1
      @computer_guess = Array.new(4) { Random.rand(1...6) }
      puts "computer guessed #{@computer_guess}"
      corrected_guess
    else
      @computer_guess = Array.new(4) { Random.rand(1...6) }
      puts "computer guessed #{@computer_guess}"
      codemaster_input
    end
  end

  def error
    puts 'Invalid input. please enter 4 numbers between 1 and 6'
    if @turn_count < 1
      code_input
    else
      codemaster_input
    end
  end
  

    def codemaster_check
      if @correct == @allowed_ints
        win
        
      elsif @correct.length <= 4 && @correct.all? { |i| @allowed_ints.include?(i) }
        puts "integer #{@correct} is correct!"
        @turn_count += 1
        codecrunch

      else
        error

      end
    end

    def codecrunch
      @correct.each { |x| @correct_code[x] = @computer_guess[x] }
    puts "correct code so far is #{@correct_code}"
    computer_init
    end

  def corrected_guess
      @correct.each { |x| @computer_guess[x] = @correct_code[x] }
    puts "corrected computer guess is #{@computer_guess}"
    codemaster_input
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
