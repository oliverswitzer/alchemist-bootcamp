defmodule NameGreeter do
  def greet do
    answer = IO.gets("Hey there, what's your name?")

    case String.trim(answer) do
      "Oliver" -> "Wow, Oliver is my favorite name"
      "Mark" -> "Ah that's the creator of Alchemist bootcamp, right?"
      _ -> "Nice name"
    end
  end
end
