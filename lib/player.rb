 require 'pry'

class Player
	attr_accessor :name, :life_points #definition des differents attributs de l'objet Player


	def initialize(name)
		@life_points = 10
		@name = name
	end

	def show_state #methode qui affiche l'état de notre joueur(nom + état de vie)
		return "#{name} a #{life_points} points de vie"
	end

	def gets_damage(number) #methode qui inflige les degats, et retourne si le joueur est mort
		@life_points -= number
		if @life_points <= 0 
			puts "Le joueur #{name} a été tué ! PAIX A SON ÂME."
		end
	end

	def attacks(player) #attaque le joueur, reprends le rand de la methode compute_damage, et appelle la methodes get_damage
		damage = compute_damage
		puts "#{self.name} attaque #{player.name}"
		puts "#{self.name} lui inflige #{damage} points de dommages. Triste !"
		player.gets_damage(damage)

	end

	def compute_damage #choisit un chiffre aléatoirement entre 1 & 6
		return rand(1..6)
	end

end

class HumanPlayer < Player #class HumanPlayer qui herite de la class Player
	attr_accessor :weapon_level

	def initialize(name)
		@life_points = 100
		@weapon_level = 1
		@name = name
	end

	def show_state
		return "#{name} a #{life_points} points de vie, et une arme de niveau #{weapon_level}"
	end

	def compute_damage #mulitplie les damages par le niveau de l'arme trouvée
    rand(1..6) * @weapon_level
  end

  def search_weapon #choisit un nombre aléatoirement qui correspond au niveau de l'arme trouvée
  	level = rand(1..6)
  	puts "\nTu as trouvé une arme de niveau #{level}"
  	if level > @weapon_level
  		@weapon_level = level 
  		puts "Bien joué ! elle est meilleure que ton arme actuelle : tu la prends"
  	else
  		puts "Fuck ! elle n'est pas mieux que ton arme actuelle..."
  	end
  end

  def search_health_pack #choisit un nombre aleatoirement qui permet de definir a quel type de health_pack le joueur a accés 
  	result = rand(1..6)
  	if result == 1
  		puts "Aucun Healt Pack à l'horizon.."
  	elsif result.between?(2,5)
  		puts "Bravo, tu as trouvé un pack de +50 points de vie !"
  		if @life_points + 50 > 100
  			@life_points = 100
  		else
  			@life_points += 50
  		end
  	elsif result == 6
  		puts "GG ! tu as trouvé un pack de +80 points de vie !"
  		if @life_points + 80 > 100
  			@life_points = 100
  		else
  			@life_points += 80
  		end
  	end
  end
end




















