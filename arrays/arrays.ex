defmodule Arrays do
  def update_users(users, id, new_attributes) do
    IO.inspect new_attributes
    user = Enum.find(users, fn user -> user.id === id end)
    updated_user = Map.merge(user, new_attributes)
    Enum.reject(users, fn user -> user.id === id end) ++ [updated_user]
  end

  def sum_list(list), do: sum_list(list, 0)
  def sum_list([], acc), do: acc
  def sum_list([ head | tail], acc), do: head + sum_list(tail)
end

#users = [%{id: 1, name: "bob"}, %{id: 2, name: "dole"}, %{id: 3, name: "danny"}]
#ArrayMutations.update_users(users, 2, %{ age: 27 })
# Should give back [%{id: 1, name: "bob"}, %{id: 2, name: "dole", age: 27}, %{id: 3, name: "danny"}]