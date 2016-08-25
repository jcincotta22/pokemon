require 'csv'
require 'pry'

class Pokemon
  attr_reader :number, :pokemon, :type_1, :type_2
  def initialize(number, pokemon, type_1, type_2)
    @number = number
    @pokemon = pokemon
    @type_1 = type_1
    @type_2 = type_2
  end

end

pokedex = []

CSV.foreach('pokedex.csv', headers: true, header_converters: :symbol) do |row|
  pokemon = Pokemon.new(row[:number], row[:pokemon], row[:type_1], row[:type_2])
  pokedex << pokemon
end


class Pokemon_fighting
  attr_reader :pokemon
  def initialize(pokemon)
    @pokemon = pokemon
  end

  def weakness(pokemon_name)
    @pokemon.each do |name|
      if pokemon_name == "Nidoran"
        print "(m/f): "
        male_or_female = gets.chomp
        if male_or_female == "m"
          pokemon_name = "Nidoran m"
        else
          pokemon_name = "Nidoran f"
        end
      end
      if name.pokemon == pokemon_name
        if name.type_1 == "Bug" || name.type_2 == "Bug"
          puts "Fire, Flying, Rock"
        elsif name.type_1 == "Dark" || name.type_2 == "Dark"
          puts "Bug, Fairy, Fight"
        elsif name.type_1 == "Dragon" || name.type_2 == "Dragon"
          puts "Dragon, Fairy, Ice"
        elsif name.type_1 == "Electric" || name.type_2 == "Electric"
          puts "Ground"
        elsif name.type_1 == "Fairy" || name.type_2 == "Fairy"
          puts "Poison, Steel"
        elsif name.type_1 == "Fighting" || name.type_2 == "Fighting"
          puts "Fairy, Flying, Psychic"
        elsif name.type_1 == "Fire" || name.type_2 == "Fire"
          puts "Ground, Rock, Water"
        elsif name.type_1 == "Flying" || name.type_2 == "Flying"
          puts "Electic, Ice, Rock"
        elsif name.type_1 == "Ghost" || name.type_2 == "Ghost"
          puts "Dark, Ghost"
        elsif name.type_1 == "Grass" || name.type_2 == "Grass"
          puts "Bug, Fire, Flying, Ice, Poison"
        elsif name.type_1 == "Ground" || name.type_2 == "Ground"
          puts "Grass, Ice, Water"
        elsif name.type_1 == "Ice" || name.type_2 == "Ice"
          puts "Fighting, Fire, Rock, Steel"
        elsif name.type_1 == "Normal" || name.type_2 == "Normal"
          puts "Fighting"
        elsif name.type_1 == "Poison" || name.type_2 == "Poison"
          puts "Ground, Psychic"
        elsif name.type_1 == "Psychic" || name.type_2 == "Psychic"
          puts "Bug, Dark, Ghost"
        elsif name.type_1 == "Rock" || name.type_2 == "Rock"
          puts "Fight, Grass, Ground, Steel, Water"
        elsif name.type_1 == "Steel" || name.type_2 == "Steel"
          puts "Fight, Fire, Ground"
        else
          puts "Electric, Grass"
        end
      end
    end
  end

  def type_look_up(type)
    pokemon.each do |pokemon|
      if pokemon.type_1 == type || pokemon.type_2 == type
        puts pokemon.pokemon
      end
    end

  end
end
fighting = Pokemon_fighting.new(pokedex)

puts "Which pokemon are you going to fight?"
user_input = gets.chomp
puts "#{user_input} is weak against these type of pokemon: "
puts

fighting.weakness(user_input)
puts

puts "What type of of pokemon are you looking for?"
user_input = gets.chomp
puts "Here is a list of the pokemon you should use in your fight: "
puts

fighting.type_look_up(user_input)
