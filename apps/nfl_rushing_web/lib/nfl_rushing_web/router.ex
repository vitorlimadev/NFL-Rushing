defmodule NflRushingWeb.Router do
  use NflRushingWeb, :router

  pipeline :api do
    plug CORSPlug, [origin: "http://localhost:3000"]
    plug :accepts, ["json"]
  end

  scope "/api", NflRushingWeb do
    pipe_through :api

    get "/player-rushing", PlayerRushingController, :index
    get "/player-rushing/:name", PlayerRushingController, :show
  end
end
