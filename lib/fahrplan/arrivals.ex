defmodule Fahrplan.Arrivals do
  
  @docmodule """
  Finds Arrivals for StationId
  """

  def get(station_id, datetime \\ nil ) do
    if datetime == nil do 
      datetime = :calender.local_time
    end
    {{y,m,d}, {h,mm,_seconds}} = datetime 
    date = "#{y}-#{m}-#{d}"
    time = "#{h}:#{mm}-#{d}"
    Fahrplan.Client.request("arrivalBoard", %{id: station_id, date: date, time: time})
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

  def process({:ok, body}) do
    IO.puts "success"
    body["ArrivalBoard"]["Arrival"]
  end

  def process({:error, error}) do
    IO.puts "error"
    error
  end

end
