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

  #  1> recursive:zip([a,b,c],[1,2,3])
  # [{a,1},{b,2},{c,3}]
  def zip(list1, list2), do: zip(list1, list2, []) |> Enum.reverse
  def zip(list1, list2, acc) when length(list1) === 0 or length(list2) === 0, do: acc
  def zip([h1|t1], [h2|t2], acc), do: zip(t1, t2, [{h1, h2} | acc])

  def zipper([], []), do: []
  def zipper([h1 | t1], [h2 | t2]), do: [{h1, h2} | zip(t1, t2)]

  #  [3, 1, 2, 4, 5]
  def quicksort([]) do
    []
  end

  def quicksort([pivot | rest]) do
    # pivot: 3   rest: [1, 2, 4, 5]
    {smaller, larger} = partition(pivot, rest, [], [])
    # {[2,1], [4,5]}
    quicksort(smaller) ++ [pivot] ++ quicksort(larger)
    # quicksort([2, 1]) + [3] + quicksort([5, 4])
  end

  def partition(_, [], smaller, larger), do: {smaller, larger}
  def partition(pivot, [head | tail], smaller, larger) do
    #  P: 3, h: 1, t: [2, 4, 5], [], []
    #  P: 3, h: 2, t: [4, 5], [1], []
    #  P: 3, h: 4, t: [5], [2, 1], [4]
    #  P: 3, h: 5, t: [], [2, 1], [5, 4]
    if(head <= pivot) do
      partition(pivot, tail, [head | smaller], larger)
    else
      partition(pivot, tail, smaller, [head | larger])
    end
  end
end
