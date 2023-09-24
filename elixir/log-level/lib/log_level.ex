defmodule LogLevel do
  @log_level_codes %{
    {0, false} => :trace,
    {1, true} => :debug,
    {1, false} => :debug,
    {2, true} => :info,
    {2, false} => :info,
    {3, true} => :warning,
    {3, false} => :warning,
    {4, true} => :error,
    {4, false} => :error,
    {5, false} => :fatal
  }

  @teams_to_receive_alerts %{
    {:error, false} => :ops,
    {:error, true} => :ops,
    {:fatal, false} => :ops,
    {:fatal, true} => :ops,
    {:unknown, true} => :dev1,
    {:unknown, false} => :dev2
  }

  def to_label(level, legacy?) do
    case @log_level_codes[{level, legacy?}] do
      nil -> :unknown
      log_level -> log_level
    end
  end

  def alert_recipient(level, legacy?) do
    log_level = to_label(level, legacy?)

    case @teams_to_receive_alerts[{log_level, legacy?}] do
      nil -> false
      team -> team
    end
  end
end
