defmodule Pensieve.Repo.Migrations.CreateMemories do
  use Ecto.Migration

  def change do
    create table(:memories) do
      add :title, :string, null: false, size: 100
      add :content, :text

      timestamps(type: :utc_datetime)
    end
  end

  # UP/DOWN equivalent
  # def up do
  #   create table(:memories) do
  #     add :title, :string, null: false, size: 100
  #     add :content, :text

  #     timestamps()
  #   end
  # end

  # def down do
  #   drop table(:memories)
  # end
end