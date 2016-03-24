defmodule Fahrplan.JourneyDetail do 

  def get(url) do
    Fahrplan.Client.request(url)
    |> process
  end

  defp process({:ok, result}) do
    result["JourneyDetail"]
  end

end
