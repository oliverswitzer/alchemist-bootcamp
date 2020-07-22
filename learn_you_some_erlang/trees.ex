defmodule BST do
  def node(val, left \\ nil, right \\ nil), do: {val, left, right}

  # Base case: add new_val as a new node to the left if we reach a leaf node (i.e. left and right are nil)
  def insert(new_val, {val, nil, nil}), do: {val, {new_val, nil, nil}, nil}

  # When new val is greater than the current nodes val, insert to the left of the current node
  def insert(new_val, {val, left, right}) when new_val < val do
    {val, insert(new_val, left), right}
  end

  # When new val is greater than the current nodes val, insert to the right of the current node
  def insert(new_val, {val, left, right}) when new_val > val do
    {val, left, insert(new_val, right)}
  end

  # When new val is the same as the current node, return the current node (noop)
  def insert(new_val, {val, left, right}) do
    {val, left, right}
  end
end

root = BST.node(3, BST.node(2, BST.node(1, nil, nil)), BST.node(4, nil, nil))