class GameBoard
attr_accessor :board, :vis_board, :width, :height

def initialize(width, height)
  @width = (1..width).to_a
  @height = height
  @board = build_board(width, height)
  @vis_board = build_vis_board(width, height)
  #p "board is #{@board}" # need non-destructive way of creating vis_board
  #p "vis_board is #{@vis_board}"
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
def build_vis_board(width, height) #(board_hash)
  board = Hash.new(0)
  (1..width).each do |row_val|
    array = []
    (1..height).each do |col_val|
      array.push(' ')
    end
    board[row_val] = array
  end
  board
  #board_hash.each do |key, val|
  #  val.map { |num| ' ' }
  #end
end

# accepts empty space board and prints to console
def print_board(board_hash, height)
  matrix = []
   (1..height).reverse_each do |row|
     new_row = []
     board_hash.each do |_key, col|
       new_row.push(col[row - 1])
     end
     matrix.push(new_row)
   end
   matrix.each do |row|
     p row.join(' | ')
   end    
 end

end