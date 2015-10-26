defmodule AutouchBackend.TouchTest do
  use AutouchBackend.ModelCase

  alias AutouchBackend.Touch

  @valid_attrs %{box: 42, touch_at: "2015-10-20T01:15:30.051Z"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Touch.changeset(%Touch{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Touch.changeset(%Touch{}, @invalid_attrs)
    refute changeset.valid?
  end
end
