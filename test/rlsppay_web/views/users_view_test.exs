defmodule RlsppayWeb.UsersViewTest do
  use RlsppayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rlsppay.{Account, User}
  alias RlsppayWeb.UsersView

  test "renders create.json" do
    params = %{
      name: "Rodrigo",
      password: "123456",
      nickname: "rlsp",
      email: "rlsp@gmail.com",
      age: 27
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rlsppay.create_user(params)

    response = render(UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{
          balance: Decimal.new("0.00"),
          id: account_id
        },
        id: user_id,
        name: "Rodrigo",
        nickname: "rlsp"
      }
    }

    assert expected_response == response
  end
end
