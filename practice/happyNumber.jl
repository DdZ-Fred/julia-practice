
squareStrNum(x) = parse(Int64, x) ^ 2;

"Checks whether the passed number `n` is a happy number or not"
function isHappyNumber(n::Int64)::Bool
  isHappy = false;

  cycles = 0;
  result = n;
  tmpStr = "";

  while cycles <= 8 && isHappy == false
    tmpStr = string(result)
    result = sum(
      map(
        squareStrNum,
        split(tmpStr,"")
      )
    );

    if result == 1
      isHappy = true;
    end
    cycles += 1;
  end

  return isHappy
end


n0 = "bla";
n1 = 2;   # Not happy
n2 = 9;   # Not happy
n3 = 13;  # Happy
n4 = 34;  # Not happy
n5 = 44;  # Happy

println("Is $(n1) happy ? $(isHappyNumber(n1))")
println("Is $(n2) happy ? $(isHappyNumber(n2))")
println("Is $(n3) happy ? $(isHappyNumber(n3))")
println("Is $(n4) happy ? $(isHappyNumber(n4))")
println("Is $(n5) happy ? $(isHappyNumber(n5))")