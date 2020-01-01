defmodule AutouchBackend.User do
  use AutouchBackend.Web, :model

  schema "users" do
    field :display_name, :string
    has_many :auth_methods, AutouchBackend.AuthMethod
    has_many :touches, AutouchBackend.Touch

    timestamps
  end

  @required_fields ~w(display_name)
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
