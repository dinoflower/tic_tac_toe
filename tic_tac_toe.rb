# frozen_string_literal: true

module TicTacToe
  # one game of tic-tac-toe
  class Game
    WIN_CONS = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9],
      [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]
    ].freeze
    attr_accessor :current_player, :winner
    attr_reader :board, :moves_made

    def initialize(player1, player2)
      @board = Array.new(9) { @board.fill('_', (0...8)) }
      @players = [player1.new(self, 'X'), player2.new(self, 'O')]
      @moves_made = {}
      @winner = 0
      display_board
      @current_player = @players.sample
      puts "#{@current_player.symbol} goes first."
    end

    def play_game
      if @winner != 0
        puts "Congratulations, #{@winner.symbol}! Play again?"
      elsif !@board.include?('_')
        puts 'We have a tie! Play again?'
      else
        puts "#{@current_player.symbol}, make your move (type a number)."
        @current_player.place_symbol(gets.chomp.to_i)
      end
    end

    def display_board
      rows = @board.each { |row| row.join('|') }
      print rows
    end
  end

  # each player for the tic-tac-toe game, X and O
  class Player
    attr_reader :symbol

    def initialize(game, symbol)
      @game = game
      @symbol = symbol
    end

    def place_symbol(location)
      if @board[location - 1] == '_'
        @board[location - 1] = symbol
        @moves_made[location] = symbol
      end
      display_board
      check_winners
      pass_turn
    end

    def check_winners
      plays = @moves_made.collect { |location, symbol| location if symbol == self.symbol }.compact
      return unless WIN_CONS.any? { |line| line == line.intersection(plays) }

      @winner = self
    end

    def pass_turn
      @current_player = !@current_player
    end
  end
end
