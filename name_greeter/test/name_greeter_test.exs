defmodule NameGreeterTest do
  use ExUnit.Case
  doctest NameGreeter

  test "greets the world" do
    assert NameGreeter.hello() == :world
  end
end
