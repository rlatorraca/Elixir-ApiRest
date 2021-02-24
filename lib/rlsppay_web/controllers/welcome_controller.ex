defmodule RlsppayWeb.WelcomeController do
  use RlsppayWeb, :controller

  alias Rlsppay.Number

  def index(conn, %{"filename" => filename}) do
    #text(conn, "Welcome to RLSP-Pay API")
    filename
      |> Number.sum_numbers_from_file()
      |> manipula_resposta(conn)
  end

  defp manipula_resposta({:ok, %{file: result}}, conn) do
    conn
      |> put_status(:ok)
      |> json( %{message: "There we are you numbers summed: #{result}"})
  end

  defp manipula_resposta({:error, reason}, conn) do
    conn
      |> put_status(:bad_request)
      |> json(reason)
  end

end
