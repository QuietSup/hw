# 4. Заполнить хеш гласными буквами, где значением 
# будет являтся порядковый номер буквы в алфавите (a - 1).

def main
  alphabet = ('a'..'z').to_a

  vowels = ['a', 'e', 'i', 'o', 'u']

  hash = {}
  vowels.each do |v|
    hash[v] = alphabet.index(v) + 1
  end

  puts hash
end

main