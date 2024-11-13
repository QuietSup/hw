# Идеальный вес. Программа запрашивает у пользователя 
# имя и рост и выводит идеальный вес по формуле 
# <рост> - 110, 
# после чего выводит результат пользователю на экран 
# с обращением по имени. Если идеальный вес получается 
# отрицательным, то выводится строка "Ваш вес уже оптимальный"

def perfect_weight(height)
  height - 110
end

def main
  puts "Enter your name"
  name = gets.chomp

  puts "Enter your height in cm"
  height = Float(gets.chomp)

  print "#{name}, "

  if perfect_weight(height) < 0
    puts "your weight is already optimal"
  else
    puts "your weight is not optimal"
  end
end

main