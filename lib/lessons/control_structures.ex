defmodule Lessons.ControlStructures do
  @spec run() :: any()
  def run do
    IO.inspect([
      if(),
      unless(),
      case(),
      pin(),
      with()
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

  @spec pin() :: <<_::64, _::_*8>>
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
end
