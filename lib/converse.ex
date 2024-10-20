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
  API key not in environment variable, so it must be passed in.
  """
  def get_client(api_key) do
    Anthropix.init(api_key)
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

  @doc """
  Extracts the text from the response.
  """
  def response_text(response) do
    response
    |> elem(1)
    |> Map.get("content")
    |> List.first()
    |> Map.get("text")
  end
end
