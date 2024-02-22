defmodule Lessons.PipeOperator do
  def run do
    IO.inspect([
      "PIPE OPERATOR CHAPTER",
      tokenize(),
      check_ending()
    ])
  end

  def tokenize do
    "Elixir rocks" |> String.split()
  end

  def check_ending do
    "elixir" |> String.ends_with?("ixir")
  end
end
