module Display
  def display_get_player(number)
    system("clear")
    print "Player #{number}'s name: "
  end

  def display_greet
    puts "Welcome to the Tic Tac Toe Game!"
  end

  def display_show_turn(player_name, player_piece)
    puts "#{player_name}'s turn (Your piece: #{player_piece})"
  end

  def display_player_prompt
    print "Type 1-9 to place your piece in the respective board's cell: "
  end

  def display_invalid_input
    system("clear")
    puts "This is not a valid input"
  end

  def display_print_board(board)
    puts board
  end

  def display_draw
    puts "The game ended in a draw!"
  end

  def display_win(player_name)
    puts "#{player_name}, you won the game!"
  end
end
    
