# Since configuration is shared in umbrella projects, this file
# should only configure the :phx application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# Configure your database
config :phx, Phx.Repo,
  username: "postgres",
  password: "postgres",
  database: "phx_dev",
  hostname: "localhost",
  pool_size: 10
