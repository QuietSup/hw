# 1. Сделать хеш, содеращий месяцы и количество 
# дней в месяце. В цикле выводить те месяцы, у 
# которых количество дней ровно 30

$MONTHS_DAYS = {
  January: 31,
  February: 28,
  March: 31,
  April: 30,
  May: 31,
  June: 30,
  July: 31,
  August: 31,
  September: 30,
  October: 31,
  November: 30,
  December: 31
}

# Get an array of months that have the given number of days
# @param days [Integer] the number of days
# @return [Array<String>] an array of months
def months_by_days(days)
  $MONTHS_DAYS.select{|_,v| v == days}.keys
end

def main
  puts months_by_days(30)
end

main
