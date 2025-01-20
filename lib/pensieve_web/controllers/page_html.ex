defmodule PensieveWeb.PageHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use PensieveWeb, :html

  embed_templates "page_html/*"

  # Example function component - not used as the heex file takes preference atm
  def about(assigns) do
    ~H"""
   <h1 class="text-3xl mb-6">About</h1>

   <p>This is the Pensieve app, built using Elixir and Phoenix. 123</p>

   <p>
     &copy; <%= Date.utc_today.year %>

     <%= if Date.leap_year?(Date.utc_today) do %>
       (a leap year)
     <% else %>
       (not a leap year)
     <% end %>
   </p>
   """
  end
end
