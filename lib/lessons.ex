defmodule Lessons do
  @spec run() :: any()
  def run do
    Lessons.Enum.run()
    Lessons.ControlStructures.run()
  end
end
