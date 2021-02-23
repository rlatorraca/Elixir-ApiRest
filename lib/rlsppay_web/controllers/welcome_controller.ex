defmodule RlsppayWeb.WelcomeController do
  use RlsppayWeb, :controller

  def index(conn, _params) do
    text(conn, "Welcome to RLSP-Pay API")
  end

end
