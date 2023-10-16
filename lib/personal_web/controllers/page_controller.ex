defmodule PersonalWeb.PageController do
  use PersonalWeb, :controller

  def home(conn, _params) do
    conn
    |> assign(:page_title, "Home")
    |> render(:home)
  end

  def resume(conn, _params) do
    conn
    |> assign(:page_title, "Resume")
    |> render(:resume, layout: false)
  end

  def demos(conn, _params) do
    conn
    |> assign(:page_title, "Demos")
    |> render(:demos)
  end
end
