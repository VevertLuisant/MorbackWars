class Board
  
    attr_accessor :cell_grid
    def initialize
      reset
    end
  
    def draw
      line = cell_grid[0]
      puts "#{line[0].content} | #{line[1].content} | #{line[2].content}"
      puts "---------"
      line = cell_grid[1]
      puts "#{line[0].content} | #{line[1].content} | #{line[2].content}"
      puts "---------"
      line = cell_grid[2]
      puts "#{line[0].content} | #{line[1].content} | #{line[2].content}"
    end
  
    def display_board
  
    end
  
  # A partir de là, il est important de définir dans quel configuration le joueur gagne:
  
    def winning_position(player)
      line = win_line(player)
      col = win_column(player)
      diag = win_diagonal(player)
      [line, col, diag].any?
    end
  
    def win_line(player)
        line1 = [@cell_grid[0][0], @cell_grid[0][1], @cell_grid[0][2]].all? {|x| x.marker == player.marker}
        line2 = [@cell_grid[1][0], @cell_grid[1][1], @cell_grid[1][2]].all? {|x| x.marker == player.marker}
        line3 = [@cell_grid[2][0], @cell_grid[2][1], @cell_grid[2][2]].all? {|x| x.marker == player.marker}
        [line1, line2, line3].any?
    end
  
    def win_column(player)
      col1 = [@cell_grid[0][0], @cell_grid[1][0], @cell_grid[2][0]].all? {|x| x.marker == player.marker}
      col2 = [@cell_grid[0][1], @cell_grid[1][1], @cell_grid[2][1]].all? {|x| x.marker == player.marker}
      col3 = [@cell_grid[0][2], @cell_grid[1][2], @cell_grid[2][2]].all? {|x| x.marker == player.marker}
      [col1, col2, col3].any?
    end
  
    def win_diagonal(player)
      diag1 = [@cell_grid[0][0], @cell_grid[1][1], @cell_grid[2][2]].all? {|x| x.marker == player.marker}
      diag2 = [@cell_grid[0][2], @cell_grid[1][1], @cell_grid[2][0]].all? {|x| x.marker == player.marker}
      [diag1, diag2].any?
    end
  
  # methode qui organise l'enregistrement des choix du joueur:
    def choose_cell(player)
      puts "#{player.name.capitalize} Choisis un chiffre allant de 1 à 9. Prends garde à ce qu'il soit disponible "
      position = gets.chomp.to_i
      until (1..9).include? position
        puts "Hm? je crois que #{player.name.capitalize} a fait une faute de frappe... "
        position = gets.chomp.to_i
      end
      find_cell = nil
      @cell_grid.each do |line|
        find_cell = line.select do |x|
          x.id == position
        end
        find_cell = find_cell.first
  
        break unless find_cell == nil
      end
  
      if find_cell.marker == nil
        find_cell.marker = player.marker
      else
        puts "La case est déjà prise, triple buse! Recommence..." # eh oui, il est important de ne pas faire de doublon sur les choix
        choose_cell(player)
      end
      
    end
  
    def reset
      @cell_grid = []
      id = 1
      (0..2).each do |line|
        current_line = []
        (0..2).each do |column|
          current_line.push(Cell.new(id))
          id += 1
        end
        cell_grid.push(current_line)
      end
    end
  end
