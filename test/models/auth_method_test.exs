defmodule AutouchBackend.AuthMethodTest do
  use AutouchBackend.ModelCase

  alias AutouchBackend.AuthMethod
  alias AutouchBackend.User

  @valid_attrs %{
    user_id: 10,
    provider_name: "ios",
    provider_id: "de305d54-75b4-431b-adb2-eb6b9e546014"
  }
  @invalid_attrs %{provider_name: "ios"}

  test "changeset with valid attributes" do
    changeset = AuthMethod.changeset(%AuthMethod{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = AuthMethod.changeset(%AuthMethod{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "it belongs to a User" do
    user = Repo.insert!(%User{display_name: "Susie Queue"})
    changeset =
      AuthMethod.changeset(%AuthMethod{}, %{@valid_attrs | user_id: user.id})
    auth_method = Repo.insert!(changeset)
    auth_method = AuthMethod |> Repo.get(auth_method.id) |> Repo.preload(:user)
    assert auth_method.user.id == user.id
  end
end
