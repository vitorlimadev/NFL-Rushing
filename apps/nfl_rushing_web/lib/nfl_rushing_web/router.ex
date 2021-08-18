defmodule NflRushingWeb.Router do
  use NflRushingWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", NflRushingWeb do
    pipe_through :api

    get "/player-rushing", PlayerRushingController, :index
  end
end
