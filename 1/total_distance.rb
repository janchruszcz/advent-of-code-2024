# 1. Parse input
# 2. Find pairs (lowest with lowest and so on)
# 3. Calculate the distance between the pairs
# 4. Find total distance between left list and right list (sum of distances)

def parse_input(filename)
  left_list = []
  right_list = []

  File.open(filename).each_line do |line|
    left, right = line.split(" ").map(&:to_i)
    left_list << left
    right_list << right
  end

  [left_list, right_list]
end

def total_distance(filename)
  left_list, right_list = parse_input(filename)
  left_list.sort!
  right_list.sort!

  distances = []
  left_list.each_with_index do |left, index|
    distances << (left - right_list[index]).abs
  end

  distances.sum
end

puts total_distance("1-input.txt")
