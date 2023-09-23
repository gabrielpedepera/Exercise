defmodule FreelancerRates do
  @daily_rate 8
  @month_billable_days 22
  @decimal_places 1

  def daily_rate(hourly_rate) do
    (hourly_rate * @daily_rate * 100 / 100)
    |> Float.round(@decimal_places)
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    (@month_billable_days * daily_rate(hourly_rate))
    |> apply_discount(discount)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    daily_rate_with_discount =
      daily_rate(hourly_rate)
      |> apply_discount(discount)

    (budget / daily_rate_with_discount) |> Float.floor(@decimal_places)
  end
end
