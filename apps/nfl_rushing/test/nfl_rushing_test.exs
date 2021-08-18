defmodule NflRushing.NflRushingTest do
  use ExUnit.Case

  describe "index/1" do
    test "returns player's rushing data" do
      assert data = NflRushing.index(%{})

      assert is_list(data)
    end

    test "returns data sorted by Total Rushing Yards" do
      [first, second | _] = NflRushing.index("Yds")

      assert first["Yds"] <= second["Yds"]
    end

    test "returns data sorted by Longest Rush" do
      [first, second | _] = NflRushing.index("Lng")

      assert first["Lng"] <= second["Lng"]
    end

    test "returns data sorted by Total Rushing Touchdowns" do
      [first, second | _] = NflRushing.index("TD")

      assert first["TD"] <= second["TD"]
    end
  end
end
