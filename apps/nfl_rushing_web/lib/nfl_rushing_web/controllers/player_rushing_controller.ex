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

  def show(conn, %{"name" => name}) do
    with {:ok, player} <- NflRushing.show(%{name: name}) do
      conn
      |> put_status(200)
      |> render("show.json", %{player: player})
    else
      {:error, {:player_not_found, name}} ->
        conn
        |> put_status(400)
        |> render("player_not_found.json", %{player: name})
    end
  end
end
