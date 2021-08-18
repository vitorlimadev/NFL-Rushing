defmodule NflRushingWeb.PlayerRushingView do
  use NflRushingWeb, :view

  def render("index.json", %{data: data}) do
    %{
      data: data
    }
  end
end
