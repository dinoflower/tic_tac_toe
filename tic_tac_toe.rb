class TicTacToe
  attr_accessor :moves_made, :board
  @@moves_made = {}
  #WIN_CONDITIONS = [{:player => "X", :results => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]]}, {:player => "O", :results => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]]}]
  def initialize
    @board = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]
    @player = 0
    @location = 0
    display_board
  end
  def display_board
    board.each { |row| puts row.to_s}
  end
  def display_moves
    p @@moves_made
  end
  def play(player, location)
    unless @@moves_made.key?(location)
      @@moves_made[location] = player
      convert_location(player, location)
    end
    display_board
  end
  def convert_location(player, location)
    case location
    when 1
      @board[0][0] = player
    when 2
      @board[0][1] = player
    when 3
      @board[0][2] = player
    when 4
      @board[1][0] = player
    when 5
      @board[1][1] = player
    when 6
      @board[1][2] = player
    when 7
      @board[2][0] = player
    when 8
      @board[2][1] = player
    when 9
      @board[2][2] = player
    end
  end
end

# win conditions are all "X" or all "O" in 123, 456, 789, 159, 357, 147, 258, or 369
# class for game with win conditions - TicTacToe.new creates a new game