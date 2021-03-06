# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rlsppay,
  ecto_repos: [Rlsppay.Repo]

# Configures the endpoint
config :rlsppay, RlsppayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o2kwPVJwVbsvxPmdHDLTnUcWbsQjz6eIFJs/qIKSdMMkfLRAuqJoGD0IlnqsLays",
  render_errors: [view: RlsppayWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Rlsppay.PubSub,
  live_view: [signing_salt: "EIVzMVzt"]

config :rlsppay, Rlsppay.Repo,
    migration_primary_key: [type: :binary_id],
    migration_foreign_key: [type: :binary_id]

config :rlsppay, :basic_auth,
  username: "root",
  password: "root123"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
