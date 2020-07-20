require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

puts "A ma droite Josiane !"
player1 = Player.new("Josiane")
puts "A ma gauche José !"
player2 = Player.new("José")
while player1.life_points > 0 && player2.life_points > 0
  puts "Voici l'état des joueurs : \n \n"
  puts player1.show_state
  puts "#{player2.show_state} \n \n"
  puts "Passons à la phase d'attaque : \n \n"
  player1.attacks(player2)
  if player2.life_points <= 0 then break end
  player2.attacks(player1)
end
