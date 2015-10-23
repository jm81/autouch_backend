defmodule AutouchBackend.Repo.Migrations.CreateTouch do
  use Ecto.Migration

  def change do
    create table(:touches) do
      add :box, :integer

      timestamps
    end

  end
end
