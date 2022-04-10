class GameBoard
  attr_accessor :board, :width, :height
  
  def initialize(width, height)
    @width = (1..width).to_a
    @height = height
    @board = build_board(width, height)
    @vis_board = build_vis_board(@board)
    p "board is #{@board}" # need non-destructive way of creating vis_board
    p "vis_board is #{@vis_board}"
  end
  
  def build_board(width, height)
    board = Hash.new(0)
    (1..width).each do |row_val|
      array = []
      (1..height).each do |col_val|
        array.push([row_val, col_val])
      end
      board[row_val] = array
    end
    board
  end

  # accepts board and creates a board of empty spaces
  def build_vis_board(board_hash)
    board_hash.each do |key, val|
      val.map! { |num| ' ' }
    end
  end

  # accepts empty space board and prints to console
  def print_board(board_hash)
    board_hash.each do |key, val|
      print_line = []
      val.each do |num|
        print_line.push(num)
      end
      new = print_line.join(' | ')
      puts new
    end
  end
end