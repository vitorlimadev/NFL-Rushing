defmodule NflRushing do
  @moduledoc """
  Manipulates Player's Rushing data.
  """

  alias NflRushing.Cache

  def index(%{"sort_by" => item}) do
    cached_content()
    |> Enum.sort_by(& &1[item])
  end

  def index(%{"player_name" => name}) do
    cached_content()
    |> Enum.filter(& &1["Player"] === name)
  end

  def index(_) do
    cached_content()
  end

  defp cached_content() do
    Cache.index()
    |> Enum.map(fn [
                     {name,
                      {team, pos, att, attg, yds, avg, ydsg, td, lng, first, firstperc,
                       twentyplus, fortyplus, fum}}
                   ] ->
      %{
        "Player" => name,
        "Team" => team,
        "Pos" => pos,
        "Att" => att,
        "Att/G" => attg,
        "Yds" => yds,
        "Avg" => avg,
        "Yds/G" => ydsg,
        "TD" => td,
        "Lng" => lng,
        "1st" => first,
        "1st%" => firstperc,
        "20+" => twentyplus,
        "40+" => fortyplus,
        "FUM" => fum
      }
    end)
  end
end
