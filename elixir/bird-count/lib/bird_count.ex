defmodule BirdCount do
  def today([]), do: nil

  def today([today | _]) do
    today
  end

  def increment_day_count([]), do: [1]

  def increment_day_count([today | rest]) do
    [today + 1 | rest]
  end

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([today | rest]) do
    case today do
      0 -> true
      _ -> has_day_without_birds?(rest)
    end
  end

  def total([]), do: 0

  def total([today | rest]) do
    today + total(rest)
  end

  def busy_days([]), do: 0

  def busy_days([today | rest]) do
    case today >= 5 do
      true -> 1 + busy_days(rest)
      false -> busy_days(rest)
    end
  end
end
