
defmodule PensieveWeb.MemoryHTML do
  use PensieveWeb, :html

  embed_templates "memory_html/*"

  # attr :memories, :list, default: []

  # defp information(assigns) do
  #   ~H"""
  #     <div class="italic mb-4">
  #       These are the memories in your Pensieve <br>
  #       There are <%= length(@memories) %> memories in your Pensieve
  #     </div>
  #   """
  # end
end
