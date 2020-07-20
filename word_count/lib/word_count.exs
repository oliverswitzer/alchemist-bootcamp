filename = IO.gets("File to count the words from: ") |> String.trim()
words = File.read!(filename) |> String.split(~r{[^\w]+}) |> Enum.filter(fn x -> x != "" end)

count = words |> Enum.count
IO.puts("There are #{count} words in #{filename}")