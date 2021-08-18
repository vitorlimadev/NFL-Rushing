defmodule NflRushing.Application do
  @moduledoc false

  use Application
  alias NflRushing.Cache

  def start(_type, _args) do
    Cache.init()

    children = [
      {Phoenix.PubSub, name: NflRushing.PubSub}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: NflRushing.Supervisor)
  end
end
