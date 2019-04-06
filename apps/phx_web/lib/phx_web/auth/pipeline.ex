defmodule PhxWeb.Guardian.AuthPipeline do
  use Guardian.Plug.Pipeline, otp_app: :phx_web,
  module: PhxWeb.Guardian,
  error_handler: PhxWeb.FallbackController

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
end
