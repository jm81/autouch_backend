defmodule AutouchBackend.TouchController do
  use AutouchBackend.Web, :controller

  alias AutouchBackend.Touch

  plug :scrub_params, "touch" when action in [:create, :update]

  def index(conn, _params) do
    touches = Repo.all(Touch)
    render(conn, "index.json", touches: touches)
  end

  def create(conn, %{"touch" => touch_params}) do
    changeset = Touch.changeset(%Touch{}, touch_params)

    case Repo.insert(changeset) do
      {:ok, touch} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", touch_path(conn, :show, touch))
        |> render("show.json", touch: touch)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(AutouchBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    touch = Repo.get!(Touch, id)
    render(conn, "show.json", touch: touch)
  end

  def update(conn, %{"id" => id, "touch" => touch_params}) do
    touch = Repo.get!(Touch, id)
    changeset = Touch.changeset(touch, touch_params)

    case Repo.update(changeset) do
      {:ok, touch} ->
        render(conn, "show.json", touch: touch)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(AutouchBackend.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    touch = Repo.get!(Touch, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(touch)

    send_resp(conn, :no_content, "")
  end
end
