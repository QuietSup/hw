# 6. Сумма покупок. Пользователь вводит поочередно 
# название товара, цену за единицу и кол-во купленного 
# товара (может быть нецелым числом). Пользователь может 
# ввести произвольное кол-во товаров до тех пор, 
# пока не введет "стоп" в качестве названия товара. 
# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого 
# являются названия товаров, а значением - вложенный 
# хеш, содержащий цену за единицу товара и кол-во 
# купленного товара. Также вывести итоговую сумму 
# за каждый товар.
# Вычислить и вывести на экран итоговую сумму 
# всех покупок в "корзине".


def main
  stop_words = ['stop', 's', 'стоп']

  products = {}

  loop do
    puts "Enter the product name"
    name = gets.chomp
    break if stop_words.include?(name)

    puts "Enter the price"
    price = Float(gets.chomp)
    raise "Invalid price" if price <= 0

    puts "Enter the quantity"
    quantity = Float(gets.chomp)
    raise "Invalid quantity" if quantity <= 0

    if products.key?(name)
      products[name][:quantity] += quantity
      products[name][:price] = price
    else
      products[name] = {
        price: price,
        quantity: quantity
      }
    end
  end

  puts products

  total = products.values.inject(0) { |sum, product| sum + product[:price] * product[:quantity] }
  puts "Total price: #{total}"

  products.each do |name, product|
    puts "#{name}: #{product[:price] * product[:quantity]}"
  end
end

main
