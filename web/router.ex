defmodule BasicCrud.Router do
  use BasicCrud.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BasicCrud do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/blogs", BlogController
  end

  # Other scopes may use custom stacks.
  # scope "/api", BasicCrud do
  #   pipe_through :api
  # end
end
