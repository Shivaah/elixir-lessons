defmodule Mix.Tasks.Default do
  use Mix.Task

  @spec run(any()) :: :world
  def run(_) do
    Lessons.run()
  end
end
