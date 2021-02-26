defmodule RlsppayWeb.AccountsController do
  use RlsppayWeb, :controller

  alias Rlsppay.Account

  action_fallback RlsppayWeb.FalbackController

  def deposito(conn, params) do
    with {:ok, %Account{} = account} <- Rlsppay.deposit(params) do
      conn
      |> put_status(:created)
      |> render("update.json", account: account)
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
