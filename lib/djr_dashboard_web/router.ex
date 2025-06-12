defmodule DjrDashboardWeb.Router do
  use DjrDashboardWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {DjrDashboardWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DjrDashboardWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  scope "/api", DjrDashboardWeb do
    pipe_through :api
    resources "/manga", MangaController, only: [:new, :create, :delete]
    get "/mangas", MangaController, :index
    resources "/issue", IssueController, only: [:new, :create, :delete]
    get "/issues", IssueController, :index
    resources "/review", ReviewController, only: [:new, :create, :delete]
    get "/reviews", ReviewController, :index
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:djr_dashboard, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: DjrDashboardWeb.Telemetry
    end
  end
end
