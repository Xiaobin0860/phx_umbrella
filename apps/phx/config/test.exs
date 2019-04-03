# Since configuration is shared in umbrella projects, this file
# should only configure the :phx application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :phx, Phx.Repo,
  username: "postgres",
  password: "postgres",
  database: "phx_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
