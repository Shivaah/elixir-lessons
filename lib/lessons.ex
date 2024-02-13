defmodule Lessons do
  alias Lessons.Enum
  alias Lessons.ControlStructures
  alias Lessons.Functions

  @spec run() :: any()
  def run do
    Enum.run()
    ControlStructures.run()
    Functions.run()
  end
end
