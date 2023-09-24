defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      level == 0 && legacy? == false -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      level == 5 && legacy? == false -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    log_level = to_label(level, legacy?)

    cond do
      log_level == :error || log_level == :fatal -> :ops
      log_level == :unknown && legacy? == true -> :dev1
      log_level == :unknown && legacy? == false -> :dev2
      true -> false
    end
  end
end
