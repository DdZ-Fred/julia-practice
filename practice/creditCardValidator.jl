
function creditCardValidator(cardNumber:: Union{Int64, String}):: Bool
  cardNumberStr = typeof(cardNumber) == Int64 ? string(cardNumber) : cardNumber;

  if length(cardNumberStr) != 16
    println("Your credit card number is shorter/longer that normal: $(length(cardNumberStr)) instead of 16")
    return false
  end

  checkDigit = parse(Int32, cardNumberStr[end])

  tmp = map(x -> parse(Int32, x), [y for y in cardNumberStr[1:end-1]]);

  for idx in 1:1:length(tmp)
    if isodd(idx)
      tmp[idx] *= 2;

      if tmp[idx] > 9
        tmp[idx] = sum(
          map(
            x -> parse(Int32, x),
            split(string(tmp[idx]),"")
          )
        );
      end
    end
  end

  sumWithCheckDigit = sum([tmp..., checkDigit]);

  return sumWithCheckDigit % 10 == 0
end

cardNum1 = "343545245424345"
cardNum2 = "4908279910497895";
cardNum3 = "4070418561306052";
cardNum4 = "4020448561316052";
println("$(cardNum1) card number is valid: $(creditCardValidator(cardNum1))")
println("$(cardNum2) card number is valid: $(creditCardValidator(cardNum2))")
println("$(cardNum3) card number is valid: $(creditCardValidator(cardNum3))")
println("$(cardNum4) card number is valid: $(creditCardValidator(cardNum4))")