class CLIproject::Cli
  def start
    
    puts "Pokémon".red 
    puts "     The Card Game".white
    puts "                Base Set".blue 
    welcome 

    input = gets.strip.downcase 

    CLIproject::Api.fetch(input)

    options 
  
  end  

  def line_break
   puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=".red
  end 

  def welcome
    line_break 
    puts "Welcome to Pokemon The Card Game 'The Base set' CLI search engine!".yellow
    puts "Please type in the name of the card you would like learn more about!".blue 
    line_break
  end 

  def options 
    line_break
    puts "PLease select an attribute from below to learn more about the card!".yellow
    line_break
    puts "Want to know what type this card is? Enter 'type'.".blue
    sleep(1)
    puts "want to know what attacks this card has? Enter 'attacks'.".blue
    sleep(1)
    puts "Want to know what this cards weaknesses are? Enter 'weaknesses'".blue
    sleep(1)
    puts "Want to know how rare this card is?? Enter 'rarity'".blue
    line_break
    attributes_choices 
    choice_prompts 
    more_choices
  end 

  def attributes_choices  
     input = gets.strip.downcase 
      line_break 
      case input 
      when "type" 
        card_is 
         
      when "attacks" 
        attacks_are
        
      when "weaknesses"  
        weaknesses_are
         
      when "rarity"  
        how_rare 
         
      else 
        puts "I do not recognize that input! Please try again.  Type either 'type', 'attacks', 'weaknesses' or 'rarity'.".yellow
        line_break
        attributes_choices
      end
  end 

  def more_choices
      input = gets.chomp.downcase 
      line_break 
      case input 
      when "attributes"
        options 
      when "pokemon"
        CLIproject::PokemonCard.all.clear
        start
      when "exit"
        puts "Thank you for using The Pokemon Card Game 'Base Set' CLI search engine!".yellow
        exit 
      else 
        puts "I do not recognize that input! Please try again.  Type either 'attributes', 'pokemon' or 'exit'.".yellow
        choice_prompts 
        more_choices
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
    puts "Would you like to look up other attributes for this card? Enter 'attributes'!".blue 
    sleep(1)
    puts "Would you like to look up another pokemon? Enter 'pokemon'!".blue
    sleep(1)
    puts "Would you like to quit the The Pokemon Card Game 'Base Set' CLI search engine? Type 'exit'.".blue
    line_break
  end 

end 