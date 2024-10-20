defmodule SimpleAITest do
  use ExUnit.Case
  doctest SimpleAI

  test "greets the world" do
    assert SimpleAI.hello() == :world
  end
end
