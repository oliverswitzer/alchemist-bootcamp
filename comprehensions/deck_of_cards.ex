defmodule DeckOfCards do
  def new() do
    ranks =
      (Enum.to_list(2..10)
       |> Enum.map(&"#{&1}")) ++ ["J", "Q", "K", "A"]

    for rank <- ranks, suit <- ["♧", "♢", "♥", "♤"], do: {rank, suit}
  end
end
