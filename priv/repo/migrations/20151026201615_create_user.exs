defmodule AutouchBackend.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :display_name, :string, null: false

      timestamps
    end
  end
end
