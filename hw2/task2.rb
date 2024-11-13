# 2. Заполнить массив числами от 10 до 100 с шагом 5

def main 
  arr = (10..100).step(5).to_a
  p arr
  puts "Type: #{arr.class}"
end

main
