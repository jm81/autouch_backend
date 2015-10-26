defmodule AutouchBackend.Touch do
  use AutouchBackend.Web, :model

  schema "touches" do
    field :box, :integer
    field :touch_at, Ecto.DateTime

    timestamps
  end

  @required_fields ~w(box touch_at)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
