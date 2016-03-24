defmodule Fahrplan.CLI do

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    "args "
  end

  def process(:help) do
    IO.puts """
    help
    """
  end

  def process({:station, :query}) do
    IO.puts "stations "
  end

end
