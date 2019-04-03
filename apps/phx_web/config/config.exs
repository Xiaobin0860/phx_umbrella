# Since configuration is shared in umbrella projects, this file
# should only configure the :phx_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# General application configuration
config :phx_web,
  ecto_repos: [Phx.Repo],
  generators: [context_app: :phx]

# Configures the endpoint
config :phx_web, PhxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "29O+DmG1/VPKvGIUT6kg2Xdp72AQ8Ca21gBoaNuLwPwIlIpEJUI509qnXxODLbXH",
  render_errors: [view: PhxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxWeb.PubSub, adapter: Phoenix.PubSub.PG2]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
