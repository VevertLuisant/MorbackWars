class Player 
	attr_accessor :name, :marker
	def initialize(player = nil)
	  @name = nil
	  @player = player
	  @marker = marker
	end
  
	def player_name
	  puts "#{@player} C'est quoi ton petit nom ?"
	  name = gets.chomp
	  until name.is_a?(String)
	  end
	  @name = name
  
	end
	def random_player(*args) # méthode pour tirer au sort le joueur qui commence (merci stackoverflow et toute la doc Github...)
		args.shuffle
	  end
  
	def player_marker
	  puts "#{@name.capitalize} Choisis ton camp (X or O): "
	  marker = gets.chomp.upcase
	  until %w[X O].include? marker
		puts "Non #{@name.capitalize}, j'ai dit X ou O... Tu cherches le contact? "
		marker = gets.chomp.upcase
	  end
	  @marker = marker
	end
end
  
