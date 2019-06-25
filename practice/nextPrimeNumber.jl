include("./numberPrimeFactors.jl")

using .Numeral


function nextPrimeNumber(currentPrimeNumber:: Int64)
  nextPrimeNumberVal::Int64 = 0;
  iteration::Int64 = 1;

  while nextPrimeNumberVal == 0
    nextNumber = currentPrimeNumber + iteration;
    nextNumberFactors = Numeral.numberPrimeFactors(nextNumber);
    # println("NextNumber = $(nextNumber) => $(nextNumberFactors)")
    if isempty(nextNumberFactors) || length(nextNumberFactors) == 1
      nextPrimeNumberVal = nextNumber;
    end
    iteration += 1
  end

  return nextPrimeNumberVal;
end


requested= true;
primeNumberIdx = 0;
currentPrimeNumber = 0;

println("""
=============\n
PRIME NUMBERS\n
=============\n
""")
while requested
  previousPrimeNumber = currentPrimeNumber;
  global currentPrimeNumber = nextPrimeNumber(currentPrimeNumber);
  println("The $(primeNumberIdx == 0 ? "1st" : "next($(primeNumberIdx + 1))") prime number is: $(currentPrimeNumber)")
  println("Would you like the next one ?")

  userRequest = readline();
  lcUserRequest = lowercase(string(userRequest));

  if lcUserRequest == "yes" || lcUserRequest == "y"
    global primeNumberIdx+=1;
  elseif lcUserRequest == "no" || lcUserRequest == "n"
    global requested = false;
  else
    global currentPrimeNumber = previousPrimeNumber;
  end
end
println("Bye bye!")