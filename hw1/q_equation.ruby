# Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с. 
# Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) 
# и выводит значения дискриминанта и корней на экран. 

# Test cases:
# a = 1, b = -2, c = 1 => d=0, x1=1
# a = 1, b = -5, c = 6 => d=0, x1=3, x2=2
# a = 1, b = 2, c = 5 => d=-16

# Calculate the discriminant
# @return [Hash] A hash containing: 
# - discriminant: [Numeric]
# - root1: [Numeric, NilClass] 
# - root2: [Numeric, NilClass] 
def solve_quadratic(a, b, c)
  d = b**2 - 4*a*c
  root1 = nil
  root2 = nil
  
  if d > 0
    root1 = (-b + Math.sqrt(d)) / (2.0 * a)
    root2 = (-b - Math.sqrt(d)) / (2.0 * a)
  elsif d == 0
    root1 = -b / (2.0 * a)
  end

  return { discriminant: d, root1: root1, root2: root2 }
end

def main 
  puts "Enter the value of a"
  a = Float(gets.chomp)

  puts "Enter the value of b"
  b = Float(gets.chomp)

  puts "Enter the value of c"
  c = Float(gets.chomp)

  solution = solve_quadratic(a, b, c)
  d = solution[:discriminant]
  root1 = solution[:root1]  
  root2 = solution[:root2] 

  puts "The discriminant is #{d}"

  if root1.nil?
    puts "No real roots"
    return
  elsif root2.nil?
    puts "One real root: #{root1}"
    return
  else
    puts "Two real roots: #{root1} and #{root2}"
  end
end

main