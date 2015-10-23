defmodule AutouchBackend.Router do
  use AutouchBackend.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Other scopes may use custom stacks.
  scope "/", AutouchBackend do
    pipe_through :api

    resources "/touches", TouchController
  end
end
