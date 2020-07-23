
	class Game  
		attr_accessor :board
	  
		def initialize
		  @board = Board.new
		  @game_on = true
		end
		def message_bienvenue
			
		puts " -" * 24
		puts "|       'Bienvenue sur MORBACK WARS!'		|"
		puts "|  A la verticale, l'horizontale ou en diago'   |"
		puts "|                 Toi aussi,                    |"
		puts "|          HUMILIE TON ADVERSAIRE !!!           |"
		puts " -" * 24
		puts ""
		puts "Appuie sur entrée pour continuer:"
		gets.chomp
	  
		end
	  
		def game_over(player)
		  if @board.winning_position(player)
			puts "Congratz !  #{player.name.capitalize} remporte la partie!"
			@game_on = false
		  end
		  game_tied = true
		  @board.cell_grid.each do |line|
			if line.any? { |x| x.marker == nil }
			  game_tied = false
			  break
			end
		  end
	  
		  if game_tied
			puts "Egalité! Nul! Zéro"
			@game_on = false
		  end
		end
	  
		def game_replay
		end
	  
		def play
		  message_bienvenue
	  
		  player1 = Player.new('Joueur 1')
		  player1.player_name
	  
		  player2 = Player.new('Joueur 2')
		  player2.player_name
	  
		  puts "\n\nSalut #{player1.name.capitalize} et #{player2.name.capitalize} !"
	  
		  player_first = Player.new()
		  random = player_first.random_player(player1, player2)
	  
		  player_first = random[0]
		  player_second = random[1]
	  
		  puts "\n\n#{player_first.name.capitalize} commence!"
	  
		  player_first.player_marker
	  
		  player_second.marker = player_first.marker == 'X' ? 'O' : 'X'
	  
		  puts "\n\n"
		  puts "#{player_first.name.capitalize}, tu joueras avec #{player_first.marker}"
		  puts " "
		  puts "#{player_second.name.capitalize}, tu joueras avec #{player_second.marker}"
	  
		  player = player_first
		  @board.draw
		  while @game_on
			@board.choose_cell(player)
			@board.draw
			game_over(player)
			player = player == player_first ? player_second : player_first
		  end
		end
	  end
	  
	  play = Game.new
	  play.play
