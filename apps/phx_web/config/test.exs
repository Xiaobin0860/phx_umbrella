# Since configuration is shared in umbrella projects, this file
# should only configure the :phx_web application itself
# and only for organization purposes. All other config goes to
# the umbrella root.
use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :phx_web, PhxWeb.Endpoint,
  http: [port: 4002],
  server: false

config :phx_web, PhxWeb.Guardian,
  issuer: "phx_web",
  secret_key: "UfMDa7a0j5dGOyHEmEA0M7OjNn9763Cf8lc1ykOOhYB8ZJPqC0uh/lYF0A2MrgNt"
