defmodule AutouchBackend.UserTest do
  use AutouchBackend.ModelCase

  alias AutouchBackend.User

  @valid_attrs %{display_name: "Susie Queue"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "has many auth_methods" do
    changeset = User.changeset(%User{}, @valid_attrs)
    user = Repo.insert!(changeset)
    auth_method = Ecto.Model.build(user, :auth_methods)
    assert auth_method.__struct__ == AutouchBackend.AuthMethod
  end
end
