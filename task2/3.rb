def fib(n)
  n <= 1 ? n : fib(n - 1) + fib(n - 2)
end

array = []
index = 0

while (f = fib(index)) <= 100
  array << f
  index += 1
end

print array
