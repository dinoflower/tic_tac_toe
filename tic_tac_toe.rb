# frozen_string_literal: true

# one game of tic-tac-toe
class Game
  WIN_CONS = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9], [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]].freeze
  attr_accessor :current_player
  attr_reader :board, :moves_made

  def initialize(player1, player2)
    @board = Array.new(9) { @board.fill('_', (0...8)) }
    @players = [player1.new(self, 'X'), player2.new(self, 'O')]
    @moves_made = {}
    display_board
    @current_player = @players.sample
    puts "#{@current_player} goes first."
  end

  def display_board
    rows = @board.each { |row| row.join('|') }
    print rows
  end
end

# each player for the tic-tac-toe game, one for X and one for O
class Player
  attr_reader :symbol

  def initialize(game, symbol)
    @game = game
    @symbol = symbol
  end

  def play(location)
    unless @moves_made.key?(location)
      @moves_made[location] = symbol
      @board[location-1] = symbol
    end
    display_board
  end
end

# should something be a module? maybe tictactoe, to group all of these classes together?
# find win with intersection?
