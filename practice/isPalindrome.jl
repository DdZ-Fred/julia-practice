function isPalindrome(str::String)::Bool
  return str == reverse(str);
end


str1 = "abba";
str2 = "blalb";
str3 = "bapo";
println("$(str1) is a palindrome: $(isPalindrome(str1))")
println("$(str2) is a palindrome: $(isPalindrome(str2))")
println("$(str3) is a palindrome: $(isPalindrome(str3))")