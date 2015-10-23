defmodule AutouchBackend.TouchControllerTest do
  use AutouchBackend.ConnCase

  alias AutouchBackend.Touch
  @valid_attrs %{box: 42}
  @invalid_attrs %{}

  setup do
    conn = conn() |> put_req_header("accept", "application/json")
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, touch_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    touch = Repo.insert! %Touch{}
    conn = get conn, touch_path(conn, :show, touch)
    assert json_response(conn, 200)["data"] == %{"id" => touch.id,
      "box" => touch.box}
  end

  test "does not show resource and instead throw error when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, touch_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, touch_path(conn, :create), touch: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Touch, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, touch_path(conn, :create), touch: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    touch = Repo.insert! %Touch{}
    conn = put conn, touch_path(conn, :update, touch), touch: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Touch, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    touch = Repo.insert! %Touch{}
    conn = put conn, touch_path(conn, :update, touch), touch: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    touch = Repo.insert! %Touch{}
    conn = delete conn, touch_path(conn, :delete, touch)
    assert response(conn, 204)
    refute Repo.get(Touch, touch.id)
  end
end
