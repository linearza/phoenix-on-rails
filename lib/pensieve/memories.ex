defmodule Pensieve.Memories do
  alias Pensieve.Repo
  alias Pensieve.Memories.Memory

  @spec list_memories() :: [%Memory{}]
  def list_memories, do: Repo.all(Memory)

  @type id :: pos_integer | String.t()
  @spec get_memory!(pos_integer | String.t()) :: %Memory{}
  def get_memory!(id), do: Repo.get!(Memory, id)

  @type memory_op_result :: {:ok, %Memory{}} | {:error, %Ecto.Changeset{}}
  @spec create_memory(map) :: memory_op_result
  def create_memory(attrs \\ %{}) do
    %Memory{}
    |> Memory.changeset(attrs)
    |> Repo.insert()
  end

  @spec update_memory(%Memory{}, map) :: memory_op_result
  def update_memory(%Memory{} = memory, attrs) do
    memory
    |> Memory.changeset(attrs)
    |> Repo.update()
  end

  @spec change_memory(%Memory{}, map) :: %Ecto.Changeset{}
  def change_memory(%Memory{} = memory, attrs \\ %{}) do
    Memory.changeset(memory, attrs)
  end

  @spec delete_memory(%Memory{}) :: {:ok, %Memory{}}
  def delete_memory(%Memory{} = memory) do
    Repo.delete(memory)
  end
end
