defmodule Lessons.Modules do
  @moduledoc """
  Modules allow us to organize functions into a namespace
  """

  alias Lessons.Modules.Example
  alias Lessons.Modules.Attribute
  alias Lessons.Modules.Using

  def(run) do
    IO.inspect([
      "MODULE CHAPTER",
      Example.greeting("Adrien"),
      Attribute.greeting("Adrien"),
      Using.hello("Sean")
    ])
  end

  defmodule Example do
    def greeting(name) do
      "Hello #{name}"
    end
  end

  defmodule Attribute do
    @greeting "Hello"

    def greeting(name) do
      ~s(#{@greeting} #{name}.)
    end
  end

  defmodule Struct do
    defmodule User do
      defstruct name: "Adrien", roles: []
    end

    def create_struct do
      %Struct.User{name: "Steeve"}
    end

    def update_struct do
      steeve = create_struct()

      %{steeve | name: "Sean"}
    end

    def match_struct do
      steeve = create_struct()

      %{name: name} = steeve

      name
    end

    defmodule Hello do
      defmacro __using__(opts) do
        greeting = Keyword.get(opts, :greeting, "Hi")

        quote do
          def hello(name), do: unquote(greeting) <> ", " <> name
        end
      end
    end

    defmodule Using do
      use Hello, greeting: "Hello"
    end
  end
end
