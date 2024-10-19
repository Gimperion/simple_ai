defmodule Message do
  @moduledoc """
  This module is responsible for creating messages and payloads to facilitate AI conversation threads.
  """

  def create_message(role, content) do
    %{
      role: role,
      content: content
    }
  end

  @doc """
  Creates a payload for the AI conversation.  Options include:
  - claude-3-sonnet-20240229
  - claude-3-haiku-20240307
  - claude-3-5-sonnet-20240620
  """
  def create_payload(model, messages) do
    %{
      model: model,
      messages: messages
    }
  end
end
