class Board
  
    attr_accessor :cell_grid
    def initialize
      reset
    end
  
    def draw
      row = cell_grid[0]
      puts "#{row[0].content} | #{row[1].content} | #{row[2].content}"
      puts "---------"
      row = cell_grid[1]
      puts "#{row[0].content} | #{row[1].content} | #{row[2].content}"
      puts "---------"
      row = cell_grid[2]
      puts "#{row[0].content} | #{row[1].content} | #{row[2].content}"
    end
  
    def display_board
  
    end
  
    def winning_position(player)
      row = win_row(player)
      col = win_column(player)
      dia = win_diagonal(player)
      [row, col, dia].any?
    end
  
    def win_row(player)
        row1 = [@cell_grid[0][0], @cell_grid[0][1], @cell_grid[0][2]].all? {|x| x.marker == player.marker}
        row2 = [@cell_grid[1][0], @cell_grid[1][1], @cell_grid[1][2]].all? {|x| x.marker == player.marker}
        row3 = [@cell_grid[2][0], @cell_grid[2][1], @cell_grid[2][2]].all? {|x| x.marker == player.marker}
        [row1, row2, row3].any?
    end
  
    def win_column(player)
      col1 = [@cell_grid[0][0], @cell_grid[1][0], @cell_grid[2][0]].all? {|x| x.marker == player.marker}
      col2 = [@cell_grid[0][1], @cell_grid[1][1], @cell_grid[2][1]].all? {|x| x.marker == player.marker}
      col3 = [@cell_grid[0][2], @cell_grid[1][2], @cell_grid[2][2]].all? {|x| x.marker == player.marker}
      [col1, col2, col3].any?
    end
  
    def win_diagonal(player)
      dia1 = [@cell_grid[0][0], @cell_grid[1][1], @cell_grid[2][2]].all? {|x| x.marker == player.marker}
      dia2 = [@cell_grid[0][2], @cell_grid[1][1], @cell_grid[2][0]].all? {|x| x.marker == player.marker}
      [dia1, dia2].any?
    end
  
    def choose_cell(player)
      puts "#{player.name.capitalize} Choisis un chiffre allant de 1 à 9. Prends garde à ce qu'il soit disponible "
      position = gets.chomp.to_i
      until (1..9).include? position
        puts "Hm? je crois que #{player.name.capitalize} a fait une faute de frappe... "
        position = gets.chomp.to_i
      end
      find_cell = nil
      @cell_grid.each do |row|
        find_cell = row.select do |x|
          x.id == position
        end
        find_cell = find_cell.first
  
        break unless find_cell == nil
      end
  
      if find_cell.marker == nil
        find_cell.marker = player.marker
      else
        puts "La case est déjà prise, triple buse! Recommence..."
        choose_cell(player)
      end
      
    end
  
    def reset
      @cell_grid = []
      id = 1
      (0..2).each do |row|
        current_row = []
        (0..2).each do |column|
          current_row.push(Cell.new(id))
          id += 1
        end
        cell_grid.push(current_row)
      end
    end
  end