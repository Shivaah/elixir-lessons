defmodule Lessons.Functions do
  alias Lessons.Functions.Length
  alias Lessons.Functions.Greeter
  alias Lessons.Functions.Greeter2

  def run do
    IO.inspect([
      "FUNCTIONS CHAPTER",
      ano(),
      ano_shortand(),
      pattern_matching(),
      Length.of([1, 1, 1, 1, 1, 1, 1, 1, 1, 1]),
      match_argument(%{name: "Adrien", age: 14}),
      match_argument_order_switch(%{name: "Adrien", age: 14}),
      Greeter.hello(["John", "Jack", "Tony"]),
      Greeter2.default_argument("Adrien"),
      Greeter2.default_argument("Adrien", "es")
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

  defmodule Length do
    @spec of(list()) :: non_neg_integer()

    @doc """
    let’s explore recursion using named functions:
    """
    def of([]), do: 0
    def of([_ | tail]), do: 1 + of(tail)
  end

  @doc """
  We can pattern-match the argument on the presence of that key like this
  """
  def match_argument(%{name: person_name} = person) do
    "Hello #{person_name} is a part of map :  #{person |> Map.keys() |> Enum.map(&"#{&1}, #{person[&1]} ")}"
  end

  def match_argument_order_switch(person = %{name: person_name}) do
    "Hello #{person_name} is a part of map :  #{person |> Map.keys() |> Enum.map(&"#{&1}, #{person[&1]} ")}"
  end

  def number_guard(x) when is_number(x) do
    x
  end

  defmodule Greeter do
    @moduledoc """
    Example of using guards with functions
    """

    def hello(names) when is_list(names) do
      names = Enum.join(names, ", ")

      hello(names)
    end

    def hello(name) when is_binary(name) do
      phrases() <> name
    end

    def phrases, do: "Hello "
  end

  defmodule Greeter2 do
    def default_argument(name, language_code \\ "en") do
      phrase(language_code) <> name
    end

    def phrase("en"), do: "Hello, "
    def phrase("es"), do: "Hola ,"
  end
end
