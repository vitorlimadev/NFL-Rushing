defmodule NflRushing.Cache do
  @moduledoc """
  Responsible for caching Player's Rushing data.
  """

  require Logger

  @table :player_rushing

  @spec init :: :ok | {:err, {:invalid_json, map}}
  def init() do
    :ets.new(@table, [:set, :protected, :named_table, {:read_concurrency, true}])

    case execute() do
      :ok ->
        Logger.info("[#{__MODULE__}] Player's rushing cache loaded with up-to-date data.")

      err ->
        Logger.error("[#{__MODULE__}] Error loading player's rushing cache: #{inspect(err)}")
        err
    end
  end

  def execute() do
    with {:ok, player_rushing_info_list} <- parse_json_file(),
         {:ok, :cached} <- fill_cache(player_rushing_info_list) do
      :ok
    else
      {:error, %Jason.DecodeError{} = err} ->
        {:err, {:invalid_json, err}}
    end
  end

  defp parse_json_file() do
    :nfl_rushing
    |> :code.priv_dir()
    |> Path.join("rushing.json")
    |> File.read!()
    |> Jason.decode()
  end

  defp fill_cache(player_rushing_info_list) do
    player_rushing_info_list
    |> Enum.map(
      &:ets.insert(@table, {
        &1["Player"],
        {
          &1["Team"],
          &1["Pos"],
          &1["Att"],
          &1["Att/G"],
          parse_yds(&1["Yds"]),
          &1["Avg"],
          &1["Yds/G"],
          &1["TD"],
          parse_lng(&1["Lng"]),
          &1["1st"],
          &1["1st%"],
          &1["20+"],
          &1["40+"],
          &1["FUM"]
        }
      })
    )

    {:ok, :cached}
  end

  # Stores Lng as integers to sort them easier but keeps touchdown information.
  defp parse_lng(lng) when is_binary(lng) do
    {value, touchdown?} = Integer.parse(lng)

    case touchdown? do
      "T" -> {value, "T"}
      _ -> value
    end
  end

  defp parse_lng(lng), do: lng

  # Normalizes incorrect string Yds data to integer
  defp parse_yds(value) when is_binary(value) do
    {number, _} = Integer.parse(value)

    number
  end

  defp parse_yds(value), do: value

  @spec index :: [list]
  def index() do
    :ets.match(@table, :"$1")
  end
end
