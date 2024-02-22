defmodule Lessons do
  alias Lessons.Enum
  alias Lessons.ControlStructures
  alias Lessons.Functions
  alias Lessons.PipeOperator
  alias Lessons.Modules

  @spec run() :: any()
  def run do
    Enum.run()
    ControlStructures.run()
    Functions.run()
    PipeOperator.run()
    Modules.run()
  end
end
