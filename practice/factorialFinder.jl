function factorialFinder(n::Int64)
  if n == 1 || n == 0
    return 1;
  end
  return n * factorialFinder(n -1);
end

n1 = 2;
n2 = 3;
n3 = 4;
n4 = 5;
println("Factorial of $(n1) is: $(factorialFinder(n1))")
println("Factorial of $(n2) is: $(factorialFinder(n2))")
println("Factorial of $(n3) is: $(factorialFinder(n3))")
println("Factorial of $(n4) is: $(factorialFinder(n4))")