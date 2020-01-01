defmodule AutouchBackend.Repo.Migrations.AddUserIdToTouches do
  use Ecto.Migration

  def change do
    alter table(:touches) do
      add :user_id, references(:users, on_delete: :delete_all)
    end

    create index(:touches, [:user_id, :touch_at])
  end
end
