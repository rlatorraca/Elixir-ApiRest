defmodule Rlsppay.Users.Create do
  alias Rlsppay.{Repo, User}

  def call(params) do
    params
      |> User.changeset()
      |> Repo.insert()
  end
end
