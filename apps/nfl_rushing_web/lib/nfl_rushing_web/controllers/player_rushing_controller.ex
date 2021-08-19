defmodule NflRushingWeb.PlayerRushingController do
  use NflRushingWeb, :controller

  def index(conn, %{"sort_by" => item}) do
    conn
    |> put_status(200)
    |> render("index.json", %{data: NflRushing.index(%{sort_by: item})})
  end

  def index(conn, _) do
    conn
    |> put_status(200)
    |> render("index.json", %{data: NflRushing.index()})
  end

  def show(conn, params) do
    conn
    |> put_status(200)
    |> render("show.json", %{player: NflRushing.show(params)})
  end
end
