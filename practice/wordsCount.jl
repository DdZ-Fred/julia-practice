module WordsCount

  import Base.Filesystem: pwd, joinpath

  "Counts the number of words included in the passed `str` string"
  function stringCount(str::String)::Integer
    println("$(str)")
    splitted = filter(x -> x != "", split(str, [',', '.', '!', '\'', ' ', '\n']));
    return length(splitted)
  end
  export stringCount

  "Counts the number of words included in the `filePath` passed"
  function fileCount(filePath::Any)::Integer
    fileContent = "";
    try
      fileContent = open(f->read(f, String), filePath) # Automatically closed
    catch e
      @warn e
    end
    fileCount = stringCount(fileContent);
    return fileCount;
  end
  export fileCount
end

fileName = "wordsCount.data.txt";
filePath = joinpath(pwd(), "practice/$(fileName)");
println("'$(fileName)' contains $(WordsCount.fileCount(filePath))")