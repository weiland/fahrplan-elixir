defmodule Fahrplan.Departures do
  
  @docmodule """
  Finds Departures for StationId
  """

  def get(station_id, datetime \\ nil ) do
    if datetime == nil do 
      datetime = :calendar.local_time
    end
    {{y,m,d}, {h,mm,_seconds}} = datetime 
    date = "#{y}-#{m}-#{d}"
    time = "#{h}:#{mm}-#{d}"
    Fahrplan.Client.request("departureBoard", %{id: station_id, date: date, time: time})
    |> process
  end

  def find(station_name) do
    Fahrplan.Stations.get(station_name)
    |> get_station_id
    |> get
  end

  def get_station_id(station_result) do
    Map.get(station_result, "id")
  end

  defp process({:ok, body}) do
    IO.puts "success"
    body["DepartureBoard"]["Departure"]
  end

  defp process({:error, error}) do
    IO.puts "error"
    error
  end

end
