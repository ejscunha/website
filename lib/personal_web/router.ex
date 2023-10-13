defmodule PersonalWeb.Router do
  use PersonalWeb, :router

  import Phoenix.LiveDashboard.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :put_root_layout, html: {PersonalWeb.Layouts, :root}
    plug :put_secure_browser_headers
  end

  pipeline :admin do
    plug :auth
  end

  scope "/", PersonalWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  scope "/admin" do
    pipe_through [:browser, :admin]

    live_dashboard "/dashboard", metrics: PersonalWeb.Telemetry
  end

  defp auth(conn, _opts) do
    password = System.get_env("ADMIN_DASHBOARD_PASSWORD", "secret123")
    Plug.BasicAuth.basic_auth(conn, username: "admin", password: password)
  end
end
