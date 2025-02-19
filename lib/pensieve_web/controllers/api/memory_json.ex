defmodule PensieveWeb.API.MemoryJSON do
  alias Pensieve.Memories.Memory

  def index(%{memories: memories}) do
    %{data: for(memory <- memories, do: data(memory))}
  end

  def show(%{memory: memory}) do
    %{data: data(memory)}
  end

  defp data(%Memory{} = memory) do
    %{
      id: memory.id,
      content: memory.content,
      title: memory.title
    }
  end
end
