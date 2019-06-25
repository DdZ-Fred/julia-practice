"Returns the sum of all the numbers in the passed Array"
function sum(a)
  s::Int64 = 0;
  for x in a
    s += x;
  end
  s;
end

"Returns the sum of the the 2 arguments"
function sum(a, b)
  a + b
end