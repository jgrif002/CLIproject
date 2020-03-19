class CLIproject::Cli
  def start

    welcome 

    input = gets.strip.downcase 

    CLIproject::Api.fetch(input)

    options 
  
  end  

  def line_break
   puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-="
  end 

  def welcome 
    puts "Welcome to Pokemon The Card Game 'The Base set' CLI search engine!"
    line_break
    puts "Please type in the name of the card you would like learn more about!"
    line_break
  end 

  def options 
    puts "PLease select an attribute from below to learn more about the card!"
    line_break
    sleep(2)
    puts "Want to know what type this card is? Enter 'type'."
    puts "want to know what attacks this card has? Enter 'attacks'."
    puts "Want to know what this cards weaknesses are? Enter 'weaknesses'"
    puts "Want to know how rare this card is?? Enter 'rarity'"
    line_break
    attributes_choices 
    choice_prompts 
    more_choices
  end 

  def attributes_choices  
    while input = gets.strip.downcase 
      case input 
      when "type" 
        card_is 
        break 
      when "attacks"
        attacks_are
        break
      when "weaknesses" 
        weaknesses_are
        break 
      when "rarity" 
        how_rare 
        break 
      else !input.include?("type" || "weaknesses" || "rarity" || "attacks")
        puts "I do not recognize that input! Please try again.  Type either 'type', 'attacks', 'weaknesses' or 'rarity'."
      end
    end 
  end 

  def more_choices
    while input = gets.chomp.downcase 
      case input 
      when "attributes"
         
        options 
        break 
      when "pokemon"
        CLIproject::PokemonCard.all.clear
        start 
        break 
      when "exit"
        puts "Thank you for using The Pokemon Card Game 'Base Set' CLI search engine!"
        exit 
      else input != ("attributes" || "pokemon" || "exit") 
        choice_prompts 
      end 
    end 
  end
  
  def card_is
    CLIproject::PokemonCard.all.each do |atr|
      puts atr.types
    end 
  end 

  def weaknesses_are 
    CLIproject::PokemonCard.all.each do |atr|
      atr.weaknesses.each do |w|
        puts w["type"] 
      end 
    end 
  end 

  def attacks_are 
    CLIproject::PokemonCard.all.each do |atr|
      atr.attacks.each do |a|
         puts a["name"] 
      end 
    end 
  end 

  def how_rare 
    CLIproject::PokemonCard.all.each do |atr|
      puts atr.rarity 
    end 
  end 

  def choice_prompts
    line_break 
    puts "Would you like to look up other attributes for this card? Enter 'attributes'!" 
    puts "Would you like to look up another pokemon? Enter 'pokemon'!"
    puts "Would you like to quit the The Pokemon Card Game 'Base Set' CLI search engine? Type 'exit'."
    line_break
  end 

end 