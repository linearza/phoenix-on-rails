defmodule PensieveWeb.Router do
  use PensieveWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PensieveWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # plug :put_format, "json"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PensieveWeb do
    pipe_through :browser

    live "/wizards/search", WizardLive
    resources "/wizards", WizardController
    resources "/memories", MemoryController
    get "/", PageController, :home
    get "/about", PageController, :about
  end

  # Other scopes may use custom stacks.
  scope "/api", PensieveWeb.API do
    pipe_through :api

    resources "/memories", MemoryController, except: [:new, :edit]
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:pensieve, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PensieveWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
