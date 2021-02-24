defmodule RlsppayWeb.WelcomeController do
  use RlsppayWeb, :controller

  alias Rlsppay.Number

  def index(conn, %{"filename" => filename}) do
    #text(conn, "Welcome to RLSP-Pay API")
    filename
      |> Number.sum_numbers_from_file()
      |> handle_response(conn)
  end

  defp handle_response({:ok, %{file: result}}, conn) do
    conn
      |> put_status(:ok)
      |> json( %{message: "There we are you numbers summed: #{result}"})
  end

  defp handle_response({:error, reason}, conn) do
    conn
      |> put_status(:bad_request)
      |> json(reason)
  end

end
