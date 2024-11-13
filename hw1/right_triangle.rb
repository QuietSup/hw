# Sorts triangle sides in ascending order
# can be used to find the hypotenuse (which is first retruned values)
# @return [Numeric, Numeric, Numeric] longest, middle, shortest
def sort_sides(a, b, c)
  sides = [a, b, c]
  sides.sort! # because hypotenuse is always the longest side

  return sides[2], sides[0], sides[1]
end

# Checks if a triangle is right
def is_right?(a, b, c)
  h, s1, s2 = sort_sides(a, b, c)

  s1 * s1 + s2 * s2 == h * h
end

def is_isosceles?(a, b, c)
  a == b || a == c || b == c
end

# Checks if a triangle is equilateral
def is_equilateral?(a, b, c)
  a == b && a == c
end

def main
  puts "Enter the length of the first side"
  a = Float(gets.chomp)
  raise "The first side must be a positive number" if a <= 0

  puts "Enter the length of the second side"
  b = Float(gets.chomp)
  raise "The second side must be a positive number" if b <= 0

  puts "Enter the length of the third side"
  c = Float(gets.chomp)
  raise "The third side must be a positive number" if c <= 0

  equilateral = is_equilateral?(a, b, c) # used to avoid is_right? call if is_equilateral? is true
  if equilateral 
    puts "The triangle is equilateral"
  elsif is_isosceles?(a, b, c)
    puts "The triangle is isosceles"
  end

  if !equilateral && is_right?(a, b, c)
    puts "The triangle is right"
  end
end

main
