class Player
  attr_accessor :name
  attr_accessor :life_points

  def initialize(name_to_save)
    @name = name_to_save
    @life_points = 10
  end

  def show_state
    "#{@name} a #{@life_points} points de vie"
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