defmodule PhoenixThoughtbot.Router do
  use PhoenixThoughtbot.Web, :router

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

  scope "/", PhoenixThoughtbot do
    pipe_through :api

    resources "/contacts", ContactController
  end
end
