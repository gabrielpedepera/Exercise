defmodule KitchenCalculator do
  @conversion_table %{
    cup: 240,
    fluid_ounce: 30,
    teaspoon: 5,
    tablespoon: 15,
    milliliter: 1
  }

  def get_volume({_unit, value} = _volume_pair) do
    value
  end

  def to_milliliter({unit, _value} = volume_pair) do
    {:milliliter, @conversion_table[unit] * get_volume(volume_pair)}
  end

  def from_milliliter({:milliliter, value}, unit) do
    {unit, value / @conversion_table[unit]}
  end

  def from_milliliter({:milliliter, value}, :milliliter) do
    {:milliliter, value}
  end

  def convert(volume_pair, unit) do
    to_milliliter(volume_pair)
    |> from_milliliter(unit)
  end
end
