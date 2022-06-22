# frozen_string_literal: true

# playable TicTacToe game
module TicTacToe
  # one game of tic-tac-toe
  class Game
    WIN_CONS = [
      [1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 5, 9],
      [3, 5, 7], [1, 4, 7], [2, 5, 8], [3, 6, 9]
    ].freeze
    attr_accessor :current_player, :winner, :board, :moves_made

    def initialize(player1, player2)
      @board = Array.new(9) { ' ' }
      @players = [player1.new(self, 'X'), player2.new(self, 'O')]
      @moves_made = {}
      @winner = ''
      display_board
      @current_player = @players.sample
      puts "#{@current_player.symbol} goes first."
    end

    def display_board
      row_one = @board[0, 3].join(' | ')
      row_two = @board[3, 3].join(' | ')
      row_three = @board[6, 3].join(' | ')
      bar = '--+---+--'
      printer_board = "#{row_one}\n#{bar}\n#{row_two}\n#{bar}\n#{row_three}"
      puts printer_board
    end

    def play_game
      while @winner == '' && @board.include?(' ')
        puts "#{@current_player.symbol}, make your move (type a number)."
        place_symbol(@current_player)
      end
      if @winner != ''
        puts "Congratulations, #{@winner.symbol}!"
      elsif !@board.include?(' ')
        puts 'We have a tie!'
      end
    end

    def place_symbol(player)
      player.make_play
      display_board
      check_winners
      @current_player = pass_turn
    end

    def store_data(selection)
      @board[selection - 1] = @current_player.symbol
      @moves_made[selection] = @current_player.symbol
    end

    def check_winners
      plays = @moves_made.collect { |location, symbol| location if symbol == @current_player.symbol }.compact
      return unless WIN_CONS.any? { |line| line == line.intersection(plays) }

      @winner = @current_player
    end

    def pass_turn
      if @current_player == @players[0]
        @players[1]
      else
        @players[0]
      end
    end
  end

  # each player for the tic-tac-toe game, X and O
  class Player
    attr_reader :symbol, :game

    def initialize(game, symbol)
      @game = game
      @symbol = symbol
    end

    def make_play
      selection = gets.chomp.to_i
      if @game.board[selection - 1] == ' '
        @game.store_data(selection)
        # pass_turn should go here
      elsif @game.board[selection - 1] != ' '
        puts 'That space is taken! Please choose another.' # currently changes whose turn it is
      else
        puts '...'
      end
    end
  end

  Game.new(Player, Player).play_game
end
