defmodule NflRushing do
  @moduledoc """
  Manipulates Player's Rushing data.
  """

  alias NflRushing.Cache

  @doc """
  Lists all cached player's rushing data.
  
  iex> NflRushing.index(%{sort_by: "Yds"})
  [
    %{
      "Player" => "Will Tukuafu",
      "Team" => "SEA",
      "Pos" => "FB",
      "Att" => 2,
      "Att/G" => 0.3,
      "Yds" => 2,
      "Avg" => 1,
      "Yds/G" => 0.3,
      "TD" => 0,
      "Lng" => 2,
      "1st" => 0,
      "1st%" => 0,
      "20+" => 0,
      "40+" => 0,
      "FUM" => 0
    },
    ...
  ]
  """
  @spec index(%{sort_by: binary}) :: [map]
  def index(%{sort_by: "Lng"}) do
    cached_content()
    |> Enum.sort_by(&parse_lng_to_sort/1, &>=/2)
    |> Enum.map(&parse_response_lng/1)
  end

  def index(%{sort_by: item}) do
    cached_content()
    |> Enum.sort_by(& &1[item], &>=/2)
    |> Enum.map(&parse_response_lng/1)
  end

  @spec index :: [map]
  def index() do
    cached_content()
    |> Enum.map(&parse_response_lng/1)
  end

  # To sort by the integer value.
  defp parse_lng_to_sort(%{"Lng" => {value, "T"}}), do: value
  defp parse_lng_to_sort(%{"Lng" => value}), do: value
  # To always return a string after sorted.
  defp parse_response_lng(%{"Lng" => {value, "T"}} = player),
    do: Map.put(player, "Lng", "#{value}T")

  defp parse_response_lng(%{"Lng" => value} = player), do: Map.put(player, "Lng", "#{value}")

  @doc """
  Returns a player's rushing data.
  
  iex> NflRushing.show(%{name: "Will Tukuafu"})
  [
    %{
      "Player" => "Will Tukuafu",
      "Team" => "SEA",
      "Pos" => "FB",
      "Att" => 2,
      "Att/G" => 0.3,
      "Yds" => 2,
      "Avg" => 1,
      "Yds/G" => 0.3,
      "TD" => 0,
      "Lng" => 2,
      "1st" => 0,
      "1st%" => 0,
      "20+" => 0,
      "40+" => 0,
      "FUM" => 0
    },
    ...
  ]
  """
  @spec show(%{:name => binary}) :: any
  def show(%{name: name}) do
    result =
      cached_content()
      |> Enum.filter(&(&1["Player"] === name))

    case result do
      [player] -> {:ok, player}
      [] -> {:error, {:player_not_found, name}}
    end
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
