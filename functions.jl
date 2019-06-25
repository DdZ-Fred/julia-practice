"Calculates hammer distance between 2 strings arg1=`a` & arg2=`b`"
function hamm_dist(a::String, b::String)
  @assert (length(a) == length(b)) "The strings should have the same length"
  dist = 0;
  for (i, x) in enumerate(a)
    if a[i] !== b[i]
      dist += 1;
    end
  end
  dist
end

"Calculates hammer distance between 2 strings arg1=`a` & arg2=`b`"
function hamm_dist2(a::String, b::String)
  @assert (length(a) == length(b)) "The strings should have the same length"
  dist = 0;
  for (aChar, bChar) in zip(a,b)
    if aChar !== bChar
      dist += 1;
    end
  end
  dist
end