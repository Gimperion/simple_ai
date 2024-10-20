defmodule ConverseTest do
  use ExUnit.Case
  doctest Converse

  test "response text" do
    response = {:ok,
    %{
      "content" => [
        %{
          "text" => "Here is my favorite haiku:\n\nAutumn leaves falling,\nGentle dance on the soft wind,\nNature's quiet grace.",
          "type" => "text"
        }
      ],
      "id" => "random_id",
    }}
    assert Converse.response_text(response) == "Here is my favorite haiku:\n\nAutumn leaves falling,\nGentle dance on the soft wind,\nNature's quiet grace."
  end
end
