require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/game'

puts "---------------------------------------"
puts "---BIENVENUE SUR RAID SHADOW LEGENDS---"
puts "---------------------------------------\n\n"

puts "Quel est ton nom Guerrier ?"
print "> "
name = gets.chomp
human_player = HumanPlayer.new(name)
player1 = Player.new("Josiane")
player2 = Player.new("José")
ennemies = [player1, player2]
puts "Les guerriers adverses qui te feront la peeeeeeau :"
ennemies.each {|ennemy| puts ennemy.name}

while human_player.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "#{human_player.show_state}\n\n"
  puts "Quel action veux tu effectuer ?\n\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner\n\n"
  puts "attaquer un joueur en vue :"
  puts "0 - #{player1.show_state}"
  puts "1 - #{player2.show_state}"
  print "> "
  action = gets.chomp
  if action == 'a' then human_player.search_weapon end
  if action == 's' then human_player.search_health_pack end
  if action == '0' then human_player.attacks(player1) end
  if action == '1' then human_player.attacks(player2) end
  puts "Les autres t'attaquent\n\n"
  ennemies.each do |ennemy| 
    if human_player.life_points > 0 && ennemy.life_points > 0
      ennemy.attacks(human_player)
    end
  end
  puts "\n\n"
end

if human_player.life_points > 0 then puts "GG à toi GRAND GUERRIER TOOOOOOOP 1" end
if human_player.life_points < 0 then puts "LOOSEEEER" end
