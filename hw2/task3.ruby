# 3. Заполнить массив числами фибоначи до 100

# Generates Fibonacci numbers up to a maximum value and yields each number. 
# 
# @param [Numeric] max The maximum value for the Fibonacci sequence. 
# @yield [Numeric] Yields each Fibonacci number up to the maximum value. 
# @return [void]
def fibonacci(max)
  a = 0
  b = 1
  until b >= max
    a, b = b, a + b
    yield a if block_given?
  end
end

def main
  f_nums = []
  fibonacci(100) do |n|
    f_nums << n
  end

  p f_nums
end

main
