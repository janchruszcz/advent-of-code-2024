def parse_input
  File.read("input.txt").split("\n").map { |line| line.split.map(&:to_i) }
end

def is_increasing?(report)
  report.each_cons(2).all? { |a, b| b - a >= 1 && b - a <= 3 }
end

def is_decreasing?(report)
  report.each_cons(2).all? { |a, b| a - b >= 1 && a - b <= 3 }
end

def is_valid_report?(report)
  is_increasing?(report) || is_decreasing?(report)
end

def is_safe_with_dampener?(report)
  return true if is_valid_report?(report)
  
  report.length.times do |i|
    dampened_report = report[0...i] + report[i+1..]
    return true if is_valid_report?(dampened_report)
  end
  
  false
end

def count_safe_reports
  parse_input.count { |report| is_safe_with_dampener?(report) }
end

puts count_safe_reports