defmodule Prompting do
  def read_file(file_path) do
    case File.read(file_path) do
      {:ok, file} ->
        file
      {:error, reason} ->
        IO.puts("Error reading file: #{reason}")
    end
  end

  def fill_prompt(name, args) do
    read_file("priv/prompts/#{name}.txt")
    |> Solid.parse()
    |> elem(1)
    |> Solid.render!(args)
    |> to_string()
  end

  def map_args(key, value) do
    %{
      key => value
    }
  end
end
