mutable struct NumItem
  value:: Int64
  isPrime:: Bool
end

"Finds all prime numbers below the given integer number `i`"
function sieveOfEratosthene(n::Int64)
  list = [NumItem(x, true) for x in 2:1:n];

  for origNumItemIdx in 1:length(list)
    origNumItem = list[origNumItemIdx];

    for checkedNumItemIdx in origNumItemIdx+1:length(list)
      checkedNumItem = list[checkedNumItemIdx];

      if checkedNumItem.value % origNumItem.value == 0 && checkedNumItem.isPrime
        checkedNumItem.isPrime = false;
      end
    end
  end

  map(x -> x.value , filter(x -> x.isPrime, list))
end


println("Eratosthene of 24: $(sieveOfEratosthene(24))")