require_relative 'game.rb'

def start_game(restart = false)
  game = Game.new
  game.start
end


def player_prompt
  print 'Do you want to play again?[y/n]: '
  choice = gets.chomp.downcase
  if choice == 'y'
    start_game
    player_prompt
  elsif choice == 'n'
    puts "Thank you for playing!"
  else
    puts "Invalid input, closing"
  end
end

start_game
player_prompt
