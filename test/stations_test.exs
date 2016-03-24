defmodule StationsTest do
  use ExUnit.Case
  doctest Fahrplan

  test "Fahrplan returns list for Berlin" do
    stations = Fahrplan.Stations.find("Berlin")
    assert Enum.count(stations) > 8
  end

  test "Fahrplan returns Berlin Station" do
    station = Fahrplan.Stations.get("Berlin")
    assert station["id"] ==  "008011160"
  end

end
