defmodule RlsppayWeb.UsersController do
  use RlsppayWeb, :controller

  alias Rlsppay.User

  action_fallback RlsppayWeb.FalbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rlsppay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  """
  def create(conn, params) do
    params
      |> Rlsppay.create_user()
      |> handle_response(conn)
  end

  defp handle_response({:ok, %User{} = user}, conn ) do
    conn
      |> put_status(:created)
      |> render("create.json", user: user)
  end


  defp handle_response({:error, _result } = error,_conn ), do: error

  """

end
