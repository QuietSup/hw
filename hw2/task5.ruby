# 5. Заданы три числа, которые обозначают число, месяц, 
# год (запрашиваем у пользователя). Найти порядковый 
# номер даты, начиная отсчет с начала года. Учесть, 
# что год может быть високосным. (Запрещено 
# использовать встроенные в ruby методы для 
# этого вроде Date#yday или Date#leap?) 

def leap_year?(year)
  year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
end

# Returns an array of days in a month
# @param leap [Boolean] whether the year is a leap year
# @return [Array<Integer>] an array of days in a month
def months_days(leap: false)
  md = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  md[1] = 29 if leap
  return md
end

def main
  puts "Enter the day"
  day = Integer(gets.chomp)
  raise "Invalid day" if day < 1 || day > 31

  puts "Enter the month"
  month = Integer(gets.chomp)
  raise "Invalid month" if month < 1 || month > 12
  
  puts "Enter the year"
  year = Integer(gets.chomp)
  raise "Invalid year" if year < 1 || year > Time.now.year
  
  leap = leap_year?(year)
  md = months_days(leap: leap)
  
  raise "This month has only #{md[month - 1]} days. You entered #{day}" if day > md[month - 1]
  
  puts "The date is #{day}/#{month}/#{year}"

  ordinal = day + md.take(month - 1).sum

  puts "The ordinal is #{ordinal}"
end

main
