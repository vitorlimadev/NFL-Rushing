defmodule NflRushingWeb.PlayerRushingControllerTest do
  use NflRushingWeb.ConnCase

  describe "index/1" do
    test "returns player's rushing data", %{conn: conn} do
      assert %{"data" => data} =
               conn
               |> get("/api/player-rushing")
               |> json_response(200)

      assert is_list(data)
    end

    test "returns data sorted by Total Rushing Yards", %{conn: conn} do
      assert %{"data" => [first, second | _]} =
               conn
               |> get("/api/player-rushing")
               |> json_response(200)

      assert first["Yds"] <= second["Yds"]
    end

    test "returns data sorted by Longest Rush", %{conn: conn} do
      assert %{"data" => [first, second | _]} =
               conn
               |> get("/api/player-rushing")
               |> json_response(200)

      assert first["Lng"] <= second["Lng"]
    end

    test "returns data sorted by Total Rushing Touchdowns", %{conn: conn} do
      assert %{"data" => [first, second | _]} =
               conn
               |> get("/api/player-rushing")
               |> json_response(200)

      assert first["TD"] <= second["TD"]
    end
  end
end
