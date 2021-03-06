defmodule DexphxWeb.Router do
  use DexphxWeb, :router

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

  scope "/", DexphxWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/dex", PageController, :dex
  end

  # Other scopes may use custom stacks.
  # scope "/api", DexphxWeb do
  #   pipe_through :api
  # end
end
