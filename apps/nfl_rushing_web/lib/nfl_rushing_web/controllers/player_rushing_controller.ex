defmodule NflRushingWeb.PlayerRushingController do
  use NflRushingWeb, :controller

  def index(conn, params) do
    conn
    |> put_status(200)
    |> render("index.json", %{data: NflRushing.index(params)})
  end
end
