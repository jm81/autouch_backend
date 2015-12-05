defmodule AutouchBackend.Repo.Migrations.CreateAuthMethod do
  use Ecto.Migration

  def change do
    create table(:auth_methods) do
      add :user_id, references(:users, on_delete: :delete_all)
      add :provider_name, :string, null: false
      add :provider_id, :string, null: false

      timestamps
    end

    create index(:auth_methods, [:provider_name, :provider_id], unique: true)
  end
end
