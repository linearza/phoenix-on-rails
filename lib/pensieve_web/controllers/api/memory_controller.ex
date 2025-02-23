defmodule PensieveWeb.API.MemoryController do
  use PensieveWeb, :controller

  alias Pensieve.Memories
  alias Pensieve.Memories.Memory

  action_fallback PensieveWeb.API.FallbackController

  def index(conn, _params) do
    memories = Memories.list_memories()
    render(conn, :index, memories: memories)
  end

  def show(conn, %{"id" => id}) do
    # memory = Memories.get_memory!(id)
    # render(conn, :show, memory: memory)

    # case Memories.fetch_memory(id) do
    #   {:ok, memory} -> render(conn, :show, memory: memory)

    #   {:error, :not_found} ->
    #     conn
    #     |> put_status(:not_found)
    #     |> json(%{error: "Not found"})
    # end

    with {:ok, memory} <- Memories.fetch_memory(id) do
      render(conn, :show, memory: memory)
    end
  end

  def create(conn, %{"memory" => memory_params}) do
    # {:ok, %Memory{} = memory} = Memories.create_memory(memory_params)

    # conn
    # |> put_status(:created)
    # |> put_resp_header("location", ~p"/api/memories/#{memory}")
    # |> render(:show, memory: memory)

    with {:ok, memory} <- Memories.create_memory(memory_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/memories/#{memory}")
      |> render(:show, memory: memory)
    end
  end

  def update(conn, %{"id" => id, "memory" => memory_params}) do
    # memory = Memories.get_memory!(id)

    # {:ok, %Memory{} = memory} = Memories.update_memory(memory, memory_params)
    # render(conn, :show, memory: memory)

    with {:ok, memory} <- Memories.fetch_memory(id),
      {:ok, memory} <- Memories.update_memory(memory, memory_params) do
      render(conn, :show, memory: memory)
    end
  end

  def delete(conn, %{"id" => id}) do
    # memory = Memories.get_memory!(id)

    # {:ok, %Memory{} = memory} = Memories.delete_memory(memory)
    # send_resp(conn, :no_content, "")

    with {:ok, memory} <- Memories.fetch_memory(id),
      {:ok, _memory} = Memories.delete_memory(memory) do
      send_resp(conn, :no_content, "")
    end
  end
end
