defmodule RlsppayWeb.AccountsView do
  alias Rlsppay.{Account}

  def render("update.json", %{account: %Account{id: account_id, balance: balance}}) do
    %{
      message: "Balance changed succesfully",
        account: %{
          id: account_id,
          balance: balance
        }
    }
  end
end
