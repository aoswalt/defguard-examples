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
