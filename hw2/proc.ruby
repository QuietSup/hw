def func(x)
  puts 'before'
  a = 1
  x.call()
  puts 'after'
end

a = 0
f = proc { puts a; return }
# f = lambda { puts a; return }
func(f)