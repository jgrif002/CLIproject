class CLIproject::Api
  def self.fetch(name)
    url = "https://api.pokemontcg.io/v1/cards?name=#{name}&setCode=base1"
    response = HTTParty.get(url)
    if response["cards"] == []
      puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=".red
      puts "Uhoh! Please double check the spelling of the pokemon card! Can't quite find that one.".yellow
      puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=".red
      input = gets.chomp.downcase 
      self.fetch(input) 
    else 
    pokemon_hash = response["cards"][0]
        cardname = pokemon_hash["name"]
        types = pokemon_hash["types"]
        attacks =pokemon_hash["attacks"]
        weaknesses = pokemon_hash["weaknesses"]
        rarity = pokemon_hash["rarity"] 
        CLIproject::PokemonCard.new(cardname, types, attacks, weaknesses, rarity)
    end 
  end 
end 