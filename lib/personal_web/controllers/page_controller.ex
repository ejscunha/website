defmodule PersonalWeb.PageController do
  use PersonalWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
