# defguard in Elixir 1.6

The addition of Elixir 1.6's `defguard` improve the readability
and maintainability of a codebase.

```elixir
defguard is_adult(age) when age >= 18
```

## Readability

Instead of having the details of guard closes attached to the functions they apply to,
the logic can be separated into the `defguard` definition.


#### Without defguard

```elixir
defmodule Signup do
  def require_guardian?(age) when age >= 18 do
    false
  end

  def require_guardian?(_) do
    true
  end
end
```

#### With defguard

```elixir
defmodule Signup do
  defguard is_adult(age) when age >= 18

  def require_guardian?(age) when is_adult(age) do
    false
  end

  def require_guardian?(_) do
    true
  end
end
```

## Maintainabilty

Guard clauses can be used from other modules to share the logic between modules.

```elixir
defmodule Person.Guards do
  defguard is_adult(age) when age >= 18
end


defmodule Signup do
  import Person.Guards

  def require_guardian?(age) when is_adult(age) do
    false
  end

  def require_guardian?(_) do
    true
  end
end

defmodule Checkout do
  import Person.Guards

  def can_checkout?(age) when not is_adult(age) do
    false
  end

  def can_checkout?(_) do
    true
  end
end
```

### Documentation

* [defguard in hexdocs](https://hexdocs.pm/elixir/Kernel.html#defguard/1)
