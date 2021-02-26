defmodule Rlsppay.Accounts.Transaction do

  alias Ecto.Multi

  def call("from" => from_id, "to" => to_id, "value" => value) do
    Multi.new
  end
end
