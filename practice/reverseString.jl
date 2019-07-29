function reverseString(str::String)
  return reverse(str);
end

function reverseString2(str::String)
  strArray = split(str, "");
  reverse = "";

  for i in length(strArray):-1:1
    reverse *= strArray[i];
  end
end


@time begin
  reverseString("gibidin");
end

@time begin
  reverseString2("gilbertin")
end