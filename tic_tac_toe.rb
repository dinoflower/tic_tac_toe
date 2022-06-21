class Game #TicTacToe is too long to write
  WIN_CONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]]
  attr_reader :board, :moves_made
  def initialize
    @board = [["_", "_", "_"], ["_", "_", "_"], ["_", "_", "_"]]
    @players = [Player.new, PLayer.new]
    @location = 0
    @moves_made = {}
    display_board
  end

  def display_board
    @board.each { |row| puts row.to_s}
  end
end

class Player
  attr_reader :symbol
  def initialize(symbol)
    @symbol = symbol
  end

  def play(player, location)
    unless @moves_made.key?(location)
      @moves_made[location] = player
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