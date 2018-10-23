class Game
  attr_reader :board, :player_one, :player_two
  attr_accessor :current_player

  directions = {
    "\e[A" => "up",
    "\e[B" => "down",
    "\e[C" => "right",
    "\e[D" => "left",
    "\r" => "enter"
  }

  def intialize
    @board = Board.new
    @player_one = Player.new
    @player_two = Player.new
    get_players
    start_game
  end
  
  def get_players
    puts "Please enter player 1's name: "
    player_one.set_name(gets)
    puts "Please enter player 2's name: "
    player_two.set_name(gets)
  end

  def start_game
  end

  def run_turn
    board.print
    select_square
    switch_player
  end

  def select_square
    puts "Move to select a square"
    input = get_char
    direction = directions[input]
    board.process_input(direction, current_player)
    if direction == "return"
      
    else
      select_square
    end
  end

  def switch_player
    current_player = current_player == player_one ? player_two : player_one
  end

  def restart_game
    board.clear
    switch_player
    start_game
  end
  
  def get_char
    STDIN.echo = false
    STDIN.raw!
  
    input = STDIN.getc.chr
    if input == "\e" then
      input << STDIN.read_nonblock(3) rescue nil
      input << STDIN.read_nonblock(2) rescue nil
    end
  ensure
    STDIN.echo = true
    STDIN.cooked!
  
    return input
    
  end
end