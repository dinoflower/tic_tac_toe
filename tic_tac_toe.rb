# frozen_string_literal: true

# playable TicTacToe game
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
      @board = Array.new(9) { '  ' }
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
      elsif !@board.include?('  ')
        puts 'We have a tie! Play again?'
      else
        puts "#{@current_player.symbol}, make your move (type a number)."
        @current_player.place_symbol(gets.chomp.to_i)
      end
    end

    def display_board
      row_one = @board[0, 3].join('|')
      row_two = @board[3, 3].join('|')
      row_three = @board[6, 3].join('|')
      bar = '--+--+--'
      printer_board = "#{row_one}\n#{bar}\n#{row_two}\n#{bar}\n#{row_three}"
      puts printer_board
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
      if @board[location - 1] == '  '
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
      @current_player = !self
    end
  end

  Game.new(Player, Player)
end
