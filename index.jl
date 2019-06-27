# ────────────────────────────────────────────────────────────────────────────────
# ─── GLOBALS ────────────────────────────────────────────────────────────────────
# ────────────────────────────────────────────────────────────────────────────────

# 1. PROGRAM_FILE: Current script file
println(PROGRAM_FILE);

# 2. ARGS: Arguments passed to script (to not be confused with julia cli arguments)
for x in ARGS
    println(x);
end


# ────────────────────────────────────────────────────────────────────────────────
# ─── TYPES - 2 USAGE FLAVORS ────────────────────────────────────────────────────
# ────────────────────────────────────────────────────────────────────────────────

# ─── FLAVOR 1: ATTACHED TO VALUE/EXPRESSION ─────────────────────────────────────
# Is a Type-Assertion:
# - must be read as "is an instance of..."
# - if value/expression type doesn't match the asserted type, an exception is thrown


# ─── FLAVOR 2: ATTACHED TO VARIABLE NAME (ASSIGNMENT) ───────────────────────────
# Is a Type-Declaration:
# - variable value will always have the specified type
# - every value assigned to the variable is converted into the declared type
# - not allowed in global scope (so to be used in functions...)






# ────────────────────────────────────────────────────────────────────────────────
# ─── NUMBERS ────────────────────────────────────────────────────────────────────
# ────────────────────────────────────────────────────────────────────────────────

b0 = 0::Int;          # Represents Int based on current architecture Int32 or Int64
println(typeof(b0))
#b1 = 1::Int32;       # Returns an error because current CPU archi is x64, so the value is a Int64, though we're asserting it should be an Int32, which is wrong
b2 = 2::Int64;        # The value type is Int64 and we're asserting it's a Int64 value, all good!

# c1 = 1.0::Float32;  # Similar to above with Int32, it returns an exception because current CPU archi is x64, so the value is a Float64, though we're asserting it should be an Float32, which is wrong
c2 = 2.0::Float64;    # The value type os Float64 and we're asserting it's a Float64, all good

irrational1 = π;
println("π is of type: $(typeof(irrational1))");

println("\n[Fractions]");
rational1 = 1//4 + 1//5;
println("1//4 + 1//5 = $(rational1).\nNumerator is: $(rNum1 = numerator(rational1)) {$(typeof(rNum1))}\nDenominator is $(rDen1 = denominator(rational1)) {$(typeof(rDen1))}");
rational2 = 1//3 + 4//3;
println("1//3 + 4//3 = $(rational2)");

println("Parsing stringed-number '3' returns $(parse(Int, "3"))")

println("Quotient from Euclidean div 5 % 2 = $(div(5, 2))")
println("Remainder from Euclidean div 5 % 2 = $(5 % 2)");

println("Floor of 12.567 is $(floor(12.567))")
println("2digits Round of 12.567 is $(round(12.567, digits=2))")
println("1digit Round of 12.567 is $(round(12.567, digits=1))")

println("\n[COMPARISONS]");
println("3 > 2: $(3 > 2)")
println("2 <= 3: $(2 <= 3)")
println("2 != 3.5: $(2 != 3.5)")
println("2 == 2.0: $(2 == 2.0)")
println("2 > 1 && 3 % 2 == 1: $(2 > 1 && 3 % 2 == 1) (AND)")
println("2 > 3 || 3 % 2 == 1: $(2 > 3 || 3 % 2 == 1) (OR)")


# ────────────────────────────────────────────────────────────────────────────────
# ─── COLLECTIONS ────────────────────────────────────────────────────────────────
# ────────────────────────────────────────────────────────────────────────────────

println("\n[ARRAYS]");
# 1. Indexing
# => Starts from 1
# => Ends with index=length: which is accessible via the 'end' shortcut

list = [1, 2, 3, 4];
println("[ARRAYS/ItemFromFirstIndex] List first item is: " * string(list[1]));
println("[ARRAYS/ItemFromLastIndex] List last item is: " * string(list[end]));
println("[ARRAYS/Copy(New Ref)] a=[4,5,6]; b=a[1:end]; OR b=[:]");
println("[ARRAYS/Pop(Last removal:Mutation)] a=[1,2,3,4] popped gives $((arr=[1,2,3,4]; pop!(arr); arr))");
println("[ARRAYS/Push(Mutation)] a=[1,2,3,4] pushed with 5,6 & 7 gives $((arr=[1,2,3,4]; push!(arr, 5,6,7); arr))");
println("[ARRAYS/AppendOtherArray(Mutation)] b=[5,6,7] appended to a=[1,2,3,4] gives $((a=[1,2,3,4]; b=[5,6,7]; append!(a,b)))");
println("[ARRAYS/MatrixSum] Sum of all items in a=fill(1, (5,5)) is equal to: $(sum(fill(1, (5,5))))")
println("[ARRAYS/InitializingArray/Zeros] zeros(Float64, 2, 3) $(string(zeros(Float64, 2, 3)))");
println("[ARRAYS/OperationBetweenArrays/Addition] a=[1,2,3,4] + b=[1,1,1,1] = $([1,2,3,4] .+ [1,1,1,1])")
println("[ARRAYS/OperationBetweenArrays/Addition] a=[1,2,3,4] - b=[1,1,1,1] = $([1,2,3,4] .- [1,1,1,1])")
println("[ARRAYS/InitializingArray/Ones] ones(ComplexF64, 2, 3) $(string(ones(ComplexF64, 2, 3)))");
println("[ARRAYS/InitializingArray/Any] fill(\"\", (3, 3)) $(string(fill("", (3, 3))))");
println("[ARRAYS/ConvertionFromRange] collect(1:13) get all numbers from 1 to 13: $(collect(1:13))")
println("[ARRAYS/ConvertionFromRangeWithStep] collect(1:25:100) gets all numbers from 0 to 100 with a step of 25: $(collect(0:25:100))")
println("[ARRAYS/InclusionCheck] Is 1 included in [3,1,4] ? $(1 in [3,1,4])")
println("[ARRAYS/SpreadOperator] $((bla(x,y)=x+y; args=[1,2];)) bla(x,y)=x+y; args=[1,2]; f(args...) = $(bla(args...)) ")
println("\n");
println("[TUPLES/Initialization/Ex1] \"x=(5,5)\" is of type $(typeof((5,5)))");
println("[TUPLES/Initialization/Ex2] \"x=(3,true,\"bla\")\" is of type $(typeof((3,true, "bla")))");
println("[TUPLES/ConvertionIntoArray] $((tup1=(1,6,5); "tup1=(1,6,5) into array gives: $(collect(tup1))"))");
println("[TUPLES/InclusionCheck] Are 4.0 & \"bapo\" included in (\"bapo\", false, 4.1) ? $((tup=("bapo",false,4.1); 4.0 in tup)) & $("bapo" in tup)");

# ────────────────────────────────────────────────────────────────────────────────
# ─── STRINGS ────────────────────────────────────────────────────────────────────
# ────────────────────────────────────────────────────────────────────────────────


println("\n[STRINGS]");
a = "Fred"::String;
age = 32;

# 1. Concatenation
greeting = ("Hello " * a)::String;
println("[STRINGS/Concatenation] " * greeting);

println("\n");

# 2. Interpolation
greeting2 = "Welcome dear $(a)";
println("[STRINGS/Interpolation] " * greeting);

using Printf;
println(string("[STRINGS/string function] Frederic is ", age));
println(@sprintf("[STRINGS/Printf.@sprintf macro] 1/3 is about %2.2f...", 1/3))

println("\n");

# 2. Character extract (Char type)
lastChar = greeting[end]::Char;

println("[STRINGS/CharacterExtract] Fred last character is " * a[end]);
println("\"a\" is of type $(typeof("a"))")
println("'a' is of type $(typeof('a'))")
println("\n");

# 3. Substring extract (String type)
println("[STRINGS/SubstringExtract/RangeIndexing (copy)] 4 last characters string is: " * greeting[end-3:end]::String);
println("[STRINGS/SubstringExtract/IndexOfLastCharacter<=>Length] Index of last character (end) is: " * string(length(greeting)));
println("[STRINGS/SubstringExtract/View] First 5 characters string is: " * SubString(greeting, 1:5));
println("\n");

# 4. Helpers
emptyStr = "";
str2 = "GilbertNorbert";
str3 = "$(str2) wants to go to Mars";
println("\"\" string is empty: $(isempty(emptyStr))")
filledStr = "bapapo";
println("[STRINGS/Emptiness] \"$(filledStr)\" is empty: $(isempty(filledStr))")
println("[STRINGS/Case] Lowercase and Uppercase of $(str2) are: $(lowercase(str2)) & $(uppercase(str2))")
replacer = "Mars" => "Pluton";
println("Typeof (\"Mars\" => \"Pluton\") is $(typeof(replacer)). First obj is $(replacer.first) & Second is $(replacer.second)")
println("[STRINGS/Replacements] $(str3) then $(replace(str3, replacer))");
println("[STRINGS/FindFirst] The first occurence of \"bapo\" in \"Albert is bapo for real!\" is located at: $(findfirst("bapo", "Albert is bapo for real!"))")
strToTrim = "   Hello world!    ";
println("[STRINGS/TrimmingWithStrip] \"$(strToTrim)\" stripped of its whitespaces is: \"$(strip(strToTrim, ' '))\"")
println("\n");

# 5. Work with Unicode characters
uniStr1 = "pâl";
println("[STRINGS/UnicodeStringUtils] '$(uniStr1)' string length is $(length(uniStr1))");
println("[STRINGS/UnicodeStringUtils] '$(uniStr1)' string size(bytes) is $(sizeof(uniStr1))");
println("[STRINGS/UnicodeStringUtils] '$(uniStr1)' 1st byte is $(uniStr1[1])");
println("[STRINGS/UnicodeStringUtils] '$(uniStr1)' 2nd byte is $(uniStr1[2])");
#println("[STRINGS/UnicodeStringUtils] '$(uniStr1)' 3nd byte is $(uniStr1[3])"); Returns an error as 'â' is on 2 bytes
println("[STRINGS/UnicodeStringUtils] '$(uniStr1)' 3nd byte is $(uniStr1[4])");
println("[STRINGS/UnicodeStringUtils] Index of the start of the character whose encoding starts after the index 2 is $(nextind(uniStr1, 2))");

println("[STRINGS/Split & Join]\n  =>\"gi bi din\" string splitted gives $((spl1=split("gi bi din")))\n => Joined parts gives: $(join(spl1))")

println("[STRINGS/InclusionCheck] Is 'â' part of \"$(uniStr1)\"? $('â' in uniStr1)")

# ────────────────────────────────────────────────────────────────────────────────
# ─── FUNCTIONS ──────────────────────────────────────────────────────────────────
# ────────────────────────────────────────────────────────────────────────────────
println("\n[FUNCTIONS]");
# To know:
# - Returned value is the value of the last evaluated expression (which is the last expression in the body)
# - Unless a return statement precedes

# 1. Named functions
# __________________


# 1.1. With return statement
function sum2(a)
  s::Int64 = 0;
  for x in a
    s+= x;
  end
  return s;
  s + 1;    # Not evaluated as 'return' stops everything
end
println("[FUNCTIONS/NamedFunc/WithReturn] Sum of [1,1,1,1] is: $(sum2([1,1,1,1]))")

# 1.2. Without (last expression returned)
function op1(a)
  2a + 1;
end
println("[FUNCTIONS/NamedFunc/WithReturn] $(op1) with a=2 is: $(op1(2))")


# 1.3. Assignment Form (1.2 equivalent) = InlineFunction
op2(a) = 2a + 1;
println("[FUNCTIONS/NamedFunc/AssignmentForm] $(op2) with a=2 is: $(op2(2))")


# 2. Anonymous functions = InlineFunction
# _______________________________________

println("[FUNCTIONS/AnomymousFunc] x-> 3x+1 is anonymous! $(map(x -> 3x+1, [1,2,3]))")


# 3. Documenting function
# _______________________

"Find the fibonnacci result of `x`" fibo(x) = x^2 + 3;

"Find the fibonnacci result of `x`"
function fibo2(x::Int64)
  x^2 + 3
end
# ────────────────────────────────────────────────────────────────────────────────
# ─── COMPOSITE TYPES - OBJECTS ──────────────────────────────────────────────────
# ────────────────────────────────────────────────────────────────────────────────

# To know:
# - Properties are accessible via the dot notation
# - Used as a Constructor if called with its fields as arguments. 2 default Constructors:
#    => one with arguments of type Any (which are later converted, if possible, into the given types)
#    => one with the given types
# - Used as a Singleton if No Properties

struct Rectangle
  x:: Float64
  y:: Float64
end

rec1 = Rectangle(2.3, 5.7); # Default constructor 1
rec2 = Rectangle(2.3, 5);
println("Type of rec1 is $(typeof(rec1)). Fields are: $(( fn1 = fieldnames(Rectangle); string(fn1) * string(typeof(fn1))))")
println("Type of rec2 is $(typeof(rec2)). Fields are: $(fieldnames(Rectangle))")



# ────────────────────────────────────────────────────────────────────────────────
# ─── CONTROL FLOW ───────────────────────────────────────────────────────────────
# ────────────────────────────────────────────────────────────────────────────────

# 1. Ternary operator
# ____________________

println("[CONTROL-FLOW/TernaryOperator] x=5 > 3 ? $((x=5; x > 3 ? "yes" : "no")) ")


# 2. if/elseif/else
# _________________

if rec1.x > rec2.x
  println("[CONTROL-FLOW/if-elseif-else] rec1.x is greater than rec2.x")
elseif rec1.x == rec2.x
  println("[CONTROL-FLOW/if-elseif-else] rec1.x is equal to rec2.x")
else
  println("[CONTROL-FLOW/if-elseif-else] rec1.x smaller than rec2.x")
end


# 3. While
# ________

i4 = 10;
while i4 > 0
  println("[CONTROL-FLOW/While] $(i4)")
  global i4 -= 1
end


# 4. For loop
# ___________

# 4.1. Without item index
for i in 1:10
  println("[CONTROL-FLOW/For-loop] $(i)")
end

# 4.2. With item index
for (i, x) in enumerate(0:2:10)
  println("[CONTROL-FLOW/For-loop] $("$(i) $(x)")" )
end


# 5. Comprehensions (Array generation with For loop)
# __________________________________________________

println("[COMPREHENSIONS/INITIALIZATION] All numbers from 0 to 10 with a step of 2: $([x for x in 0:2:10])")
println("[COMPREHENSIONS/INLINE-OPERATION] [1,2,3,4,5] to which a f(x)=2x is applied gives: $([2x for x in 1:5])")


# ────────────────────────────────────────────────────────────────────────────────
# ─── SCOPES ─────────────────────────────────────────────────────────────────────
# ────────────────────────────────────────────────────────────────────────────────


val1 = 5.0;

function thesum1()
  local val1::Float64 = 5.0;
  for y in 2:2:10
    val1 += y;
  end
  val1;
end

println("thesum1 val1: $(thesum1()). outterVal1 = $(val1)")

function thesum2()
  for y in 2:2:10
    global val1 += y;
  end
  val1
end

println("thesum2 val1: $(thesum2()). outterVal1 = $(val1)")