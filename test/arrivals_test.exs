defmodule ArrivalsTest do
  use ExUnit.Case

  test "Fahrplan return Arrivals for Hamburg" do
    departures = Fahrplan.Departures.get("Hamburg")
    assert Enum.count(departures) > 0
  end

  test "Invalid Arrival station" do
    error = Fahrplan.Departures.get("x34243555534")
    assert error == nil
  end

end
