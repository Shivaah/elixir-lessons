defmodule Lessons.Functions do
  alias Lessons.Functions.Length

  def run do
    IO.inspect([
      ano(),
      ano_shortand(),
      pattern_matching(),
      Length.of([1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
    ])
  end

  @spec ano() :: 5
  def ano do
    sum = fn a, b -> a + b end

    sum.(2, 3)
  end

  @spec ano_shortand() :: 5
  def ano_shortand do
    sum = &(&1 + &2)

    sum.(2, 3)
  end

  @spec pattern_matching() :: <<_::160>>
  def pattern_matching do
    handle_result = fn
      {:ok, result} -> "Handling result... #{result}"
      {:error} -> "An error has occured"
      _ -> "No matching"
    end

    handle_result.({:error})
  end

  @doc """
  let’s explore recursion using named functions:
  """
  defmodule Length do
    def of([]), do: 0
    def of([_ | tail]), do: 1 + of(tail)
  end
end
