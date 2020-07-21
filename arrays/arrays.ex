defmodule Arrays do
  def update_users(users, id, new_attributes) do
    IO.inspect new_attributes
    user = Enum.find(users, fn user -> user.id === id end)
    updated_user = Map.merge(user, new_attributes)
    Enum.reject(users, fn user -> user.id === id end) ++ [updated_user]
  end

  #users = [%{id: 1, name: "bob"}, %{id: 2, name: "dole"}, %{id: 3, name: "danny"}]
  #ArrayMutations.update_users(users, 2, %{ age: 27 })
  # Should give back [%{id: 1, name: "bob"}, %{id: 2, name: "dole", age: 27}, %{id: 3, name: "danny"}]

  def sum_list(list), do: sum_list(list, 0)
  def sum_list([], acc), do: acc
  def sum_list([ head | tail], acc), do: head + sum_list(tail)

  def map([], _func), do: []
  def map([head | tail], func), do: [func.(head) | map(tail, func)]

  # Arrays.map([“Dave”, “Chris”, “Josh”], fn(name) -> “Hello #{name}!” end)
  #  1. [ “Hello Dave!” | Arrays.map([“Chris”, “[“Hello Dave!”, “Hello Chris!”, “Hello Josh!”]Josh”], fn(name) -> “Hello #{name}!” end) ]
  #  2. [ “Hello Dave!” | [ “Hello Chris!” | Arrays.map([“Josh”], fn(name) -> “Hello #{name}!” end) ] ]
  #  3. [ “Hello Dave!” | [ “Hello Chris!” | [“Hello Josh!” | Arrays.map([], fn(name) -> “Hello #{name}!” end)] ] ]
  #  4. [ “Hello Dave!” | [ “Hello Chris!” | [“Hello Josh!” | []] ] ]
  #  5. [“Hello Dave!”, “Hello Chris!”, “Hello Josh!”]
end