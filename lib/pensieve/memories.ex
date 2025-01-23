defmodule Pensieve.Memories do
  alias Pensieve.Repo
  alias Pensieve.Memories.Memory

  def list_memories, do: Repo.all(Memory)
  def get_memory!(id), do: Repo.get!(Memory, id)
end
