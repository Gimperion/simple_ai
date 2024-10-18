defmodule SimpleAiTest do
  use ExUnit.Case
  doctest SimpleAi

  test "greets the world" do
    assert SimpleAi.hello() == :world
  end
end
