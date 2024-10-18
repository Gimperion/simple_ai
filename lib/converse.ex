defmodule Converse do
  defp get_client do
    case System.get_env("ANTHROPIC_API_KEY") do
      nil ->
        raise "ANTHROPIC_API_KEY environment variable is not set"
      api_key ->
        Anthropix.init(api_key)
    end
  end

  def run_convo(payload) do
    Anthropix.chat(get_client(), payload)
  end
end
