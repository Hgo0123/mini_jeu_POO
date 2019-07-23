require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|A la fin il n'en restera qu'un !               |
-------------------------------------------------"

puts "Comment veux tu que ton joueur s'appelle ?"
 @name = gets.chomp

human = HumanPlayer.new(@name)

player2 = Player.new("Josiane")
player3 = Player.new("José")

enemies = Array.new

enemies.append(player2 , player3)
                                               
while human.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
	puts
	puts human.show_state
	puts "= = = = = = = = = = = = = = = = ="
	puts "Quelle action veux-tu effectuer ?

a - chercher une meilleure arme
s - chercher à se soigner 

Attaquer un joueur en vue :

0 - Josiane a #{player2.life_points} points de vie
1 - José a #{player3.life_points} points de vie"
	
	choice = gets.chomp

	case choice
		when "a"
			human.search_weapon
		when "s"
			human.search_health_pack
		when "0"
			human.attacks(player2)
		when "1"
			human.attacks(player3)
	end

	enemies.each do |enemi|
		if enemi.life_points > 0
		puts "\nAttention ! Les autres joueurs t'attaquent !"
		puts
		enemi.attacks(human)
		end
	end
end

puts "\nLa partie est finie"

if human.life_points > player2.life_points && human.life_points > player3.life_points
	puts "\nBRAVO CHAMPION ! TU AS GAGNÉ !"
else
	puts "\nLOSER ! T'ES MORT !"
end            





