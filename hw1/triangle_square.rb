# Площадь треугольника. Площадь треугольника можно 
# вычилсить, зная его основание (a) и высоту (h) 
# по формуле: 1/2*a*h. Программа должна запрашивать 
# основание и высоту треуголиника и возвращать его площадь.

def square(base, height) 
  0.5 * base * height 
end

def main
  puts "Enter the base of the triangle"
  base = Integer(gets.chomp)
  raise "The base of the triangle must be a positive number" if base <= 0
  
  
  puts "Enter the height of the triangle"
  height = Integer(gets.chomp)
  raise "The height of the triangle must be a positive number" if height <= 0
  
  area = square(base, height)
  puts "The area of the triangle is #{area}"
end

main
