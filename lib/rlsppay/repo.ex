defmodule Rlsppay.Repo do
  use Ecto.Repo,
    otp_app: :rlsppay,
    adapter: Ecto.Adapters.Postgres
end
