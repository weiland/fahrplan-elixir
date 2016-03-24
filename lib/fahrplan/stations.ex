defmodule Fahrplan.Stations do
  
  @moduledoc """
  Handles Stations
  """

  def find(query) do
    Fahrplan.Client.request('location.name', %{input: query})
    |> process
  end

  @doc """
    Returns first match
  """
  def get(station) do
    find(station)
    |> List.first
  end

  defp process({:error, body}) do
    IO.puts "error"
    IO.puts body
  end

  defp process({:ok, body}) do
    IO.puts "success"
    body["LocationList"]["StopLocation"]
  end

end
