# Since configuration is shared in umbrella projects, this file
# should only configure the :phx application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

config :phx,
  ecto_repos: [Phx.Repo]

import_config "#{Mix.env()}.exs"
