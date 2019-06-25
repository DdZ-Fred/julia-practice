function fibo(n::Int64)
  if n == 0 || n == 1
   return n;
  end
  return fibo(n-1) + fibo(n-2);
end

for i in 0:10
  println("fibo($(i))=$(fibo(i))")
end