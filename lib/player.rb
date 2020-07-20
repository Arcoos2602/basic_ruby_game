class Player
  attr_accessor :name
  attr_accessor :life_points

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
  end

  def show_state
    if @life_points <= 0 then "#{@name} est mort"
    else
      "#{@name} a #{@life_points} points de vie"
    end
  end

  def gets_damage(points)
    @life_points -= points
    if @life_points <= 0 then puts "Le joueur #{name} a été tué" end
  end

  def attacks(player)
    puts "Le joueur #{@name} attaque le joueur #{player.name}"
    damage = compute_damage
    puts "Il lui inflige #{damage} points de dégâts"
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    "#{@name} a #{@life_points} points de vie et a une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{level}"
    if level < @weapon_level then puts "FUUUUUCK, arme caca :  tu la laisse" end
    if level > @weapon_level
      @weapon_level = level
      puts "YEEEES, cet arme est METAL : tu la prends"
    end
  end

  def search_health_pack
    level = rand(1..6)
    if level == 1 then puts "Tu n'as rien trouvé" end
    if level >= 2 && level <= 5
      @life_points += 50
      if @life_points > 100 then @life_points = 100 end
      puts "Bravo tu as trouvé un pack de 50 points de vie"
    end
    if level == 6
      @life_points += 50
      if @life_points > 100 then @life_points = 100 end
      puts "Bravo tu as trouvé un pack de 80 points de vie MIAM"
    end
  end
end
