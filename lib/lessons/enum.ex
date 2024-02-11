defmodule Lessons.Enum do
  def run do
    each()
    map()
    capture()
    capture_named()
  end

  def each do
    Enum.each(["one", "two", "three"], fn s -> IO.inspect(s) end)
  end

  def map do
    result = Enum.map([0, 1, 2, 3, 4, 5], fn x -> x - 1 end)

    IO.inspect(result)
  end

  @doc """
  using capture operator with anonymous function
  """
  @spec capture() :: any()
  def capture do
    result = Enum.map([1, 2, 3], &(&1 + 3))

    IO.inspect(result)
  end

  @doc """
  using capture operator with named function
  """
  def capture_named do
    result_explicit_call = Enum.map([1, 2, 3], &minus_one(&1))
    result_implicit_call = Enum.map([1, 2, 3], &minus_one/1)

    IO.inspect([result_explicit_call, result_implicit_call])
  end

  @spec minus_one(number()) :: number()
  def minus_one(number) do
    number - 1
  end
end
