defmodule PhxWeb.Router do
  use PhxWeb, :router

  alias PhxWeb.Guardian

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :jwt_authenticated do
    plug Guardian.AuthPipeline
  end

  scope "/phx", PhxWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", PhxWeb do
    pipe_through :api

    post "/sign_up", UserController, :create
    post "/sign_in", UserController, :sign_in
    post "/sign_out", UserController, :sign_out
  end

  scope "/api", PhxWeb do
    pipe_through [:api, :jwt_authenticated]

    get "/info", UserController, :show
  end
end
