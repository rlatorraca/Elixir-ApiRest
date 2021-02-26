defmodule RlsppayWeb.FalbackController do
  use RlsppayWeb, :controller

  def call(conn, {:error, result } ) do
    conn
      |> put_status(:bad_request)
      |> put_view(RlsppayWeb.ErrorView)
      |> render("400.json", result: result)
  end

end
