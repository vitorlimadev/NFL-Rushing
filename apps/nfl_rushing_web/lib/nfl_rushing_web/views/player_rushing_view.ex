defmodule NflRushingWeb.PlayerRushingView do
  use NflRushingWeb, :view

  def render("index.json", %{data: data}), do: %{data: data}

  def render("show.json", %{player: player}), do: %{player: player}
end
