defmodule AutouchBackend.TouchTest do
  use AutouchBackend.ModelCase

  alias AutouchBackend.Touch

  @valid_attrs %{box: 42}
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
