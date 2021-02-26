defmodule Rlsppay do
  @moduledoc """
  Rlsppay keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  alias Rlsppay.Users.Create , as: UserCreate
  alias Rlsppay.Account.Deposit

  defdelegate create_user(params), to: UserCreate, as: :call

  defdelegate deposit(params), to: Deposit, as: :call

end
