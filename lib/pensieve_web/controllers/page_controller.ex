defmodule PensieveWeb.PageController do
  use PensieveWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def about(conn, _params) do

    # conn = conn
    # |> assign(:message, "Hello")
    # |> assign(:other_message, "Hola")

    conn = conn
          |> assign(:message, "Hello")
          |> assign(:other_message, "From the other side")

    # conn = merge_assigns(conn, message: "Hello", other_message: "Hola")

    render(conn, :about)
  end
end
