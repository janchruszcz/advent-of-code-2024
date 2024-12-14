### Day 3, Part I

pattern = /mul\((\d{1,3}),(\d{1,3})\)/

text = File.read("input.txt")

puts "Part I"
puts text.scan(pattern).map { |num1, num2| num1.to_i * num2.to_i }.sum

### Day 3, Part II
matches = []

text.scan(/do\(\)/) do |match|
    pos = Regexp.last_match.begin(0)
    matches << { type: :do, position: pos }
end

text.scan(/don't\(\)/) do |match|
    pos = Regexp.last_match.begin(0)
    matches << { type: :dont, position: pos }
end

text.scan(/mul\((\d{1,3}),(\d{1,3})\)/) do |num1, num2|
    pos = Regexp.last_match.begin(0)
    matches << { 
      type: :mul, 
      position: pos,
      num1: num1,
      num2: num2
    }
end

matches.sort_by! { |m| m[:position] }

enabled = true
total = 0

matches.each do |match|
    if match[:type] == :dont
        enabled = false
    elsif match[:type] == :do
        enabled = true
    elsif match[:type] == :mul
        if enabled
            result = match[:num1].to_i * match[:num2].to_i
            total += result
        end
    end
end

puts "Part II"
puts total
