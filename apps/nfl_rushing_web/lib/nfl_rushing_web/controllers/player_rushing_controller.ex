defmodule NflRushingWeb.PlayerRushingController do
  use NflRushingWeb, :controller

  def index(conn, params) do
    conn
    |> put_status(200)
    |> render("index.json", %{data: NflRushing.index(params)})
  end

  def show(conn, params) do
    conn
    |> put_status(200)
    |> render("show.json", %{player: NflRushing.show(params)})
  end
end
