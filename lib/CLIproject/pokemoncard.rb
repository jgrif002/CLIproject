class CLIproject::PokemonCard
    attr_accessor :name, :types, :attacks, :weaknesses, :rarity 
    
    @@all = []
    
    def initialize(name, types, attacks, weaknesses, rarity)
     @name = name
     @types = types 
     @attacks = attacks 
     @weaknesses = weaknesses
     @rarity = rarity
     @@all << self 
    end 
    
    def self.all 
        @@all 
    end 

    def clear
        @@all.clear 
    end 
end 