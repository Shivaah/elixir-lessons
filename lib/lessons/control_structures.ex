defmodule Lessons.ControlStructures do
  require Integer
  @spec run() :: any()
  def run do
    IO.inspect([
      "CONTROL STRUCTURES CHAPTER",
      if(),
      unless(),
      case(),
      pin(),
      with(),
      with_error()
    ])
  end

  @spec if() :: <<_::112>>
  def if do
    if String.valid?("Hello") do
      "Valid string !"
    else
      "Invalid string"
    end
  end

  @spec unless() :: <<_::80>>
  @doc """
  Using unless/2 is like if/2 only it works on the negative
  """
  def unless do
    unless is_integer("hello") do
      "Not an Int"
    end
  end

  @spec case() :: <<_::80>>
  def case do
    case {:ok, "Hello case"} do
      {:ok, result} -> result
      {:error} -> "Uh oh !"
      _ -> "Catch call"
    end
  end

  @doc """
  If you intend to match against existing variables you must use the pin ^/1 operator
  """
  def pin do
    x = 1

    case {2, 1} do
      {y, ^x} -> "Nice pin #{x} with #{y} !"
      {y, 3} -> "Not a pinned huhu for #{y}"
      _ -> "catched bro !"
    end
  end

  @spec with() :: :error | <<_::64, _::_*8>>
  @doc """
  The special form with/1 is useful when you might use a nested case/2 statement or situations that cannot cleanly be piped together
  """
  def with do
    user = %{:name => "Adrien", :age => 30}

    with {:ok, name} <- Map.fetch(user, :name),
         {:ok, age} <- Map.fetch(user, :age),
         do: "Hello #{name}, you are #{age} years old !"
  end

  @spec with_error() :: :error | :even | :odd
  def with_error do
    m = %{a: 2, c: 3}

    with {:ok, number} <- Map.fetch(m, :c),
         true <- Integer.is_even(number) do
      IO.puts("#{number} divided by 2 is #{div(number, 2)}")
      :even
    else
      :error ->
        IO.puts("We don't have this item in map")
        :error

      _ ->
        IO.puts("It is odd")
        :odd
    end
  end
end
