defmodule MessageTest do
  use ExUnit.Case
  doctest Message

  test "creates a message" do
    assert Message.create_message("user", "Hello") == %{role: "user", content: "Hello"}
  end

  test "creates a payload" do
    messages = [
      Message.create_message("user", "Hello"),
      Message.create_message("assistant", "Hi")
    ]
    assert Message.create_payload("claude-3-haiku-20240307", messages) == %{
      model: "claude-3-haiku-20240307",
      messages: [
        %{role: "user", content: "Hello"},
        %{role: "assistant", content: "Hi"}
      ]
    }
  end

end
