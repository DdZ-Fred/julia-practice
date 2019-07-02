function checkBinaryString(str::String)
  isBin = true;
  strLength = length(str);
  count = 1;

  while count <= strLength && isBin == true
    if str[count] !== '1' && str[count] !== '0'
      isBin = false;
    end
    count += 1;
  end

  isBin
end

function binaryDecimalConverter(bin::String)
  isBin = checkBinaryString(bin);

  if isBin
    println("String is a safe binary string! \"$(bin)\"")
    reversedBin = reverse(bin);
    decimalValue::Int64 = 0;

    for (i, x) in enumerate(reversedBin)
      decimalValue += x == '0' ? 0 : 2^(i-1);
    end

    return decimalValue;
  else
    return error("String contains non-binary characters! \"$(bin)\"")
  end

end

"Finds the highest 2-power constituant of `num`"
function findHighestBinPower(num::Int64)
  currentBinPower:: Int8 = 0;
  isFound = false;

  while isFound == false
    if 2^currentBinPower <= num
      currentBinPower += 1;
    else
      currentBinPower -= 1;
      isFound = true
    end
  end

  currentBinPower
end

function decimalToBinaryConverter(num::Int64)
  highestBinPower = findHighestBinPower(num);

  binString = "1";
  numRest::Int64 = num - 2^highestBinPower;

  for x in highestBinPower-1:-1:0
    if numRest == 0 | (numRest > 0 & 2^x > numRest)
      binString = binString * "0";
    else
      binString = binString * "1";
    end
  end

  binString
end

binaryDecimalConverter(decimalToBinaryConverter(256))