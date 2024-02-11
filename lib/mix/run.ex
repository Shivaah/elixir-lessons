defmodule Mix.Tasks.Run do
  use Mix.Task

  def run(_) do
    Lessons.run()
  end
end
