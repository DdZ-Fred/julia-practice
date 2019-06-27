


"Each property represent a EURO note/coin.
- i for Integer notes/coins
- h for coins representing hundredth values"
mutable struct EuroChange
  i500:: Int64
  i200:: Int64
  i100:: Int64
  i50:: Int64
  i20:: Int64
  i10:: Int64
  i5:: Int64
  i2:: Int64
  i1:: Int64
  h50:: Int64
  h20:: Int64
  h10:: Int64
  h5:: Int64
  h2:: Int64
  h1:: Int64
end

descMap = Dict(
  :i500 => "€500 note",
  :i200 => "€200 note",
  :i100 => "€100 note",
  :i50 => "€50 note",
  :i20 => "€20 note",
  :i10 => "€10 note",
  :i5 => "€5 note",
  :i2 => "€2 coin",
  :i1 => "€1 coin",
  :h50 => "€0.50 coin",
  :h20 => "€0.20 coin",
  :h10 => "€0.10 coin",
  :h5 => "€0.5 coin",
  :h2 => "€0.2 coin",
  :h1 => "€0.1 coin"
);

iMap = [
  (:i500, 500),
  (:i200, 200),
  (:i100, 100),
  (:i50, 50),
  (:i20, 20),
  (:i10, 10),
  (:i5, 5),
  (:i2, 2),
  (:i1, 1),
];

hMap = [
  (:h50, 50),
  (:h20, 20),
  (:h10, 10),
  (:h5, 5),
  (:h2, 2),
  (:h1, 1),
];

"Calculates the amount of each notes/coins to return."
function changeReturn(cost::Float64, given:: Float64)
  # Rounded is necessary as the float portion can only be between .01-.99
  roundedCost = round(cost, digits=2);
  roundedGiven = round(given, digits=2);

  change = EuroChange(zeros(Int64, 15)...);
  if roundedGiven < roundedCost
    return error("Given amount must be greather than the cost")
  elseif roundedGiven == roundedCost
    println("No change required!")
  else
    changeValue = round(roundedGiven - roundedCost, digits=2);

    # 1. Integer portion
    intPortion = Int64(trunc(changeValue));
    intRemainder = 0 + intPortion;
    for (iSymb, iVal) in iMap
      if iVal <= intRemainder
        intDivQuotient = div(intRemainder, iVal);
        setproperty!(change, iSymb, getproperty(change, iSymb) + intDivQuotient);
        intRemainder = intRemainder % iVal;
      end
    end

    # 2. Hundredth portion
    hundredthPortion = Int64(trunc((changeValue - intPortion)*100));
    hundredthRemainder = 0 + hundredthPortion;
    for (hSymb, hVal) in hMap
      # println("[HUNDREDTH] Current ite: $(hundP)")
      if hVal <= hundredthRemainder
        hundredthDivQuotient = div(hundredthRemainder, hVal);
        setproperty!(change, hSymb, getproperty(change, hSymb) + hundredthDivQuotient);
        hundredthRemainder = hundredthRemainder % hVal;
      end
    end
  end

  println("Change:")
  for prop in propertynames(change)
    println("  - x$(getfield(change,prop)): $(get(descMap,prop, "bla"))");
  end
end

