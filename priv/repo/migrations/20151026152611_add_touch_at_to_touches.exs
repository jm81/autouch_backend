defmodule AutouchBackend.Repo.Migrations.AddTouchAtToTouches do
  use Ecto.Migration

  def change do
    alter table(:touches) do
      add :touch_at, :datetime
    end
  end
end
