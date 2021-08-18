defmodule NflRushing.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: NflRushing.PubSub}
      # Start a worker by calling: NflRushing.Worker.start_link(arg)
      # {NflRushing.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: NflRushing.Supervisor)
  end
end
