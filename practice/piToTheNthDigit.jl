using Printf;

function nDigitPi(n:: Int8)
  str = "%1." * string(n);
  println("$(str)")
  @sprintf str pi
end

nDigitPi(Int8(5));