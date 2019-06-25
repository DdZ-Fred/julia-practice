module Numeral

export numberPrimeFactors

"Returns an Array containing all the factors of `n`"
function numberPrimeFactors(n::Int64)
  factors = Array{Int64,1}();

  for i in n-1:-1:1
    quotient = n / i;
    if isinteger(quotient)
      push!(factors, quotient)
      return append!(factors, numberPrimeFactors(Int64(i)))
    end
  end

  return factors;
end

end