defmodule Converse do
  @moduledoc """
  This module is responsible for handling the conversation with the Anthropix API.
  """

  defp get_client do
    case System.get_env("ANTHROPIC_API_KEY") do
      nil ->
        raise "ANTHROPIC_API_KEY environment variable is not set"
      api_key ->
        Anthropix.init(api_key)
    end
  end

  @doc """
  Passes payoad to API.

  ## Examples
    payload = [
      model: "claude-3-haiku-20240307",
      messages: [%{role: "user", content: "Say hello back!"}]
    ]
    response = Converse.run_convo(payload)
  """
  def run_convo(payload) do
    get_client()
    |> Anthropix.chat(payload)
  end
end
