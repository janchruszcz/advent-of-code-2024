# 1. Find pairs (lowest with lowest and so on)
# 2. Calculate the distance between the pairs
# 3. Find total distance between left list and right list (sum of distances)

def total_distance(left_list, right_list)
  left_list.sort!
  right_list.sort!

  distances = []
  left_list.each_with_index do |left, index|
    distances << (left - right_list[index]).abs
  end

  distances.sum
end

puts total_distance([1, 2, 3, 4, 7], [3, 3, 4, 7, 9])
