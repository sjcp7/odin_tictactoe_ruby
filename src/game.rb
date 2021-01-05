require_relative "piece"
require_relative "display"
require_relative "player"
require_relative "board"

class Game
  include Piece, Display

  def initialize
    @first_player = nil
    @second_player = nil
    @current_player = nil
    @board = Board.new
  end

  def start
    display_greet
    setup
    play
    finish
  end

 private
  
  def setup
    @first_player = create_player(1)
    @second_player = create_player(2)
  end

  def create_player(number)
    display_get_player(number)
    player_name = gets.chomp
    player_piece = [CROSS, CIRCLE][number - 1]
    Player.new(player_name, player_piece)
  end

  def play
    @current_player = @first_player
    until @board.complete? do
      play_round
      break if @board.game_over?(@current_player.piece)
      switch_current_player      
    end 
  end

    def play_round
      display_print_board(@board)
      display_show_turn(@current_player.name, @current_player.piece)
      display_player_prompt
      cell = gets.chomp.to_i

      if valid_input?(cell)        
        @board.play(cell, @current_player.piece)
      else
        display_invalid_input
        play_round
      end
    end

    def valid_input?(cell)
      if cell == 0 || @board.cell_checked?(cell)
        false
      else
        true     
      end
    end


    def switch_current_player
      if @current_player == @first_player
        @current_player = @second_player
      else
        @current_player = @first_player
      end
    end

  def finish
    system("clear")
    display_print_board(@board)
    if @board.complete?
      display_draw
    else
      display_win(@current_player.name)
    end
  end
        
end
