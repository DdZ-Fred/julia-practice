function evenStep(n::Int64)
  return trunc(Int64, n / 2);
end

function oddStep(n::Int64)
  return (n * 3) + 1;
end

function collatzConjecture(n::Int64)
  if n <= 1
    return error("You must pass a number > 1. n = $(n)")
  end

  steps = 0
  result = n;

  while result != 1
    if iseven(result)
      result = evenStep(result);
    else
      result = oddStep(result);
    end
    steps += 1;
  end

  return steps;
end

n1 = 2;
n2 = 3;
n3 = 4;
n4 = 5;

println("CollatzConj of $(n1): $(collatzConjecture(n1)) steps");
println("CollatzConj of $(n2): $(collatzConjecture(n2)) steps");
println("CollatzConj of $(n3): $(collatzConjecture(n3)) steps");
println("CollatzConj of $(n4): $(collatzConjecture(n4)) steps");