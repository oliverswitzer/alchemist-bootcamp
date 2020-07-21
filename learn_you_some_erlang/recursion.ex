defmodule Recursion do
  #  Examples from: https://learnyousomeerlang.com/recursion
  def fact(n), do: fact(n, 1)
  def fact(0, acc), do: acc
  def fact(n, acc), do: fact(n - 1, acc * n)

  #  This function takes an integer as its first parameter and then any other term as its second parameter.
  #  It will then create a list of as many copies of the term as specified by the integer.
  def duplicate(n, item), do: duplicate(n, item, [])
  def duplicate(0, _, acc), do: acc
  def duplicate(n, item, acc), do: duplicate(n - 1, item, [item | acc])

  def sublist(list, n), do: sublist(list, n, []) |> Enum.reverse
  def sublist([], n, acc), do: acc
  # Until the length of our accumulator reaches n, lets prepend the head of the list to the acc
  def sublist([head | tail], n, acc) when length(acc) < n, do: sublist(tail, n, [head | acc])
  def sublist([_ | tail], n, acc), do: sublist(tail, n, acc)
end
