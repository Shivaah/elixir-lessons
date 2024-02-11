defmodule Lessons.Enum do
  @spec run() :: any()
  def run do
    each()

    IO.inspect([
      map(),
      sort(),
      capture(),
      capture_named()
    ])
  end

  @spec each() :: :ok
  def each do
    Enum.each(["one", "two", "three"], fn s -> IO.inspect(s) end)
  end

  @spec map() :: list()
  def map do
    Enum.map([0, 1, 2, 3, 4, 5], fn x -> x - 1 end)
  end

  @spec sort() :: list()
  def sort do
    Enum.sort([%{:val => 4}, %{:val => 1}])
  end

  @doc """
  using capture operator with anonymous function
  """
  @spec capture() :: any()
  def capture do
    Enum.map([1, 2, 3], &(&1 + 3))
  end

  @spec capture_named() :: [list(), ...]
  @doc """
  using capture operator with named function
  """
  def capture_named do
    result_explicit_call = Enum.map([1, 2, 3], &minus_one(&1))
    result_implicit_call = Enum.map([1, 2, 3], &minus_one/1)

    [result_explicit_call, result_implicit_call]
  end

  @spec minus_one(number()) :: number()
  def minus_one(number) do
    number - 1
  end
end
