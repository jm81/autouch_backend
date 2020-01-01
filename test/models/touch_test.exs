defmodule AutouchBackend.TouchTest do
  use AutouchBackend.ModelCase

  alias AutouchBackend.Touch
  alias AutouchBackend.User

  @valid_attrs %{box: 42, touch_at: "2015-10-20T01:15:30.051Z", user_id: 10}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Touch.changeset(%Touch{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Touch.changeset(%Touch{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "it belongs to a User" do
    user = Repo.insert!(%User{display_name: "Susie Queue"})
    changeset = Touch.changeset(%Touch{}, %{@valid_attrs | user_id: user.id})
    touch = Repo.insert!(changeset)
    touch = Touch |> Repo.get(touch.id) |> Repo.preload(:user)
    assert touch.user.id == user.id
  end
end
