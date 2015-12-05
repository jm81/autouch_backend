defmodule AutouchBackend.AuthMethod do
  use AutouchBackend.Web, :model

  schema "auth_methods" do
    field :provider_name, :string
    field :provider_id, :string
    belongs_to :user, AutouchBackend.User

    timestamps
  end

  @required_fields ~w(user_id provider_name provider_id)
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
