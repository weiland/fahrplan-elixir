defmodule Fahrplan.Client do

  @auth_key Application.get_env(:fahrplan, :auth_key)
  @user_agent [ {"User-Agent", "Elixir Fahrplan"} ]
  @default_options %{ format: "json", lang: "de", authKey: @auth_key }
  @base_url "http://open-api.bahn.de/bin/rest.exe"

  def request(endpoint, params) do
    build_url(endpoint, params)
    |> HTTPoison.get(@user_agent)
    |> handle_response
  end

  def request(url) do 
    url |> HTTPoison.get(@user_agent)
        |> handle_response
  end

  def build_url(endpoint, params) do
    params = Map.merge(@default_options, params) |> serialize_params
    url = "#{@base_url}/#{endpoint}?#{params}"
    IO.puts url
    url
  end

  def serialize_params(params = %{}) do
    Enum.map_join(params, "&", fn ({key, value}) -> "#{key}=#{value}" end)
  end

  def handle_response({ :ok, %{status_code: 200, body: body}}) do 
    { :ok, Poison.Parser.parse!(body) }
  end

  def handle_response({ _, %{status_code: __, body: body}}) do 
    { :error, Poison.Parser.parse!(body) }
  end

end
