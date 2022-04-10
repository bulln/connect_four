require_relative 'check_match'
require_relative 'game_board'

class Game < GameBoard
include CheckMatch

attr_accessor :player_one_array, :player_two_array, :game_board
  def initialize
  @player_one_array = []
  @player_two_array = []
  @game_board = GameBoard.new(7, 6)
  self.play_game
  end

  def play_game
  winner = nil
  while winner.nil?
    # print_board(@game_board.board)
    puts "Player 1, select a column"
    puts "#{@game_board.width.join(', ')}"
    player_one_sel = player_selection()
    #spot_taken = test_board.board[player_sel].shift
    @player_one_array.push(@game_board.board[player_one_sel].shift)
    winner = "Player 1" if check_for_match(@player_one_array)
    puts "Player 2, select a column"
    puts "#{@game_board.width.join(', ')}"
    player_two_sel = player_selection
    #spot_taken = test_board.board[player_sel].shift
    @player_two_array.push(@game_board.board[player_two_sel].shift)
    winner = "Player 2" if check_for_match(@player_two_array)
  end
  p "#{winner} wins!"
  end

  def player_selection
    selection = gets.chomp.to_i
    until @game_board.width.include?(selection) do
      selection = gets.chomp.to_i
    end
    selection
  end

end