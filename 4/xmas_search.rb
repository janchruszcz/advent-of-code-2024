
file = File.read("input.txt")

### Part I

grid = file.split("\n").map { |line| line.split("") }

directions = [
  [-1, 0], # up
  [1, 0], # down
  [0, -1], # left
  [0, 1], # right
  [-1, -1], # up-left
  [-1, 1], # up-right
  [1, -1], # down-left
  [1, 1], # down-right
]

count = 0

grid.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    directions.each do |di, dj|
      word = ""
      4.times do |step|
        new_i = i + (di * step)
        new_j = j + (dj * step)
        
        if new_i >= 0 && new_i < grid.length && 
           new_j >= 0 && new_j < row.length
          word += grid[new_i][new_j]
        end
      end
      
      if word == "XMAS"
        count += 1
      end
    end
  end
end

puts count

### Part II

def check_diagonals(grid, center_i, center_j)
  # First safety check - if we're too close to any edge, 
  # we can't form a complete X
  return 0 if center_i <= 0 || center_i >= grid.length - 1 ||
             center_j <= 0 || center_j >= grid[0].length - 1

  # For diagonal 1 (top-left to bottom-right), get:
  # M(or S) - top-left position
  d1_top = grid[center_i - 1][center_j - 1]
  # S(or M) - bottom-right position
  d1_bottom = grid[center_i + 1][center_j + 1]
  
  # For diagonal 2 (top-right to bottom-left), get:
  # M(or S) - top-right position
  d2_top = grid[center_i - 1][center_j + 1]
  # S(or M) - bottom-left position
  d2_bottom = grid[center_i + 1][center_j - 1]
  
  # Make strings from each diagonal:
  # [letter1, A, letter2] becomes "letter1Aletter2"
  diagonal1 = [d1_top, 'A', d1_bottom].join
  diagonal2 = [d2_top, 'A', d2_bottom].join
  
  # These are the only valid patterns
  valid_mas = ["MAS", "SAM"]
  
  # If BOTH diagonals are valid patterns, we found an X-MAS
  if valid_mas.include?(diagonal1) && valid_mas.include?(diagonal2)
    return 1
  end
  0
end

count = 0
grid.each_with_index do |row, i|
  row.each_with_index do |cell, j|
    next unless cell == 'A'
    next if i == 0 || i == grid.length - 1 # Skip edges
    next if j == 0 || j == row.length - 1  # Skip edges
    
    count += check_diagonals(grid, i, j)
  end
end

puts count