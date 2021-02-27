defmodule RlsppayWeb.AccountsControllerTest do
  use RlsppayWeb.ConnCase, async: true

  alias Rlsppay.{Account, User}

  describe "deposit/2" do
    setup %{conn: conn} do
      params = %{
        name: "Rodrigo",
        password: "123456",
        nickname: "rlsp",
        email: "rlsp@gmail.com",
        age: 35
      }

      {:ok, %User{account: %Account{id: account_id}}} = Rlsppay.create_user(params)

      conn = put_req_header(conn, "authorization", "Basic cm9vdDpyb290MTIz")

      {:ok, conn: conn, account_id: account_id}
    end

    test "when all params are valid, make a deposit", %{conn: conn, account_id: account_id} do
      params = %{"value" => "23.74"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:created)

      assert %{
               "account" => %{"balance" => "23.74", "id" => _id},
               "message" => "Balance changed successfully"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn, account_id: account_id} do
      params = %{"value" => "banana"}

      response =
        conn
        |> post(Routes.accounts_path(conn, :deposit, account_id, params))
        |> json_response(:bad_request)

      expected_response = %{"message" => "Invalid deposit value!"}

      assert response == expected_response
    end
  end
end
