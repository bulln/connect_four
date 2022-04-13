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

  # add something to prevent error when column full
  # break out of loop INSTANTLY when player wins (rather than full loop running first)
  # need to capture DIAGONAL wins

  def play_game
  winner = nil
  while winner.nil?
    print_board(@game_board.vis_board, @game_board.height)
    puts "Player 1, select a column"
    puts "#{@game_board.width.join(', ')}"
    player_one_sel = player_selection
    @player_one_array.push(@game_board.board[player_one_sel].shift)
    @game_board.vis_board[player_one_sel][@game_board.vis_board[player_one_sel].find_index(' ')] = 'x'
    p "vis board is #{@game_board.vis_board}"
    p "game board is #{@game_board.board}"
    p "player 1 array is #{@player_one_array}"
    winner = "Player 1" if check_for_match(@player_one_array)
    print_board(@game_board.vis_board, @game_board.height)
    puts "Player 2, select a column"
    puts "#{@game_board.width.join(', ')}"
    player_two_sel = player_selection
    @player_two_array.push(@game_board.board[player_two_sel].shift)
    @game_board.vis_board[player_two_sel][@game_board.vis_board[player_two_sel].find_index(' ')] = 'o'
    p "game board is #{@game_board.board}"
    p "player 2 array is #{@player_two_array}"
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