defmodule AutouchBackend.TouchView do
  use AutouchBackend.Web, :view

  def render("index.json", %{touches: touches}) do
    %{data: render_many(touches, AutouchBackend.TouchView, "touch.json")}
  end

  def render("show.json", %{touch: touch}) do
    %{data: render_one(touch, AutouchBackend.TouchView, "touch.json")}
  end

  def render("touch.json", %{touch: touch}) do
    %{id: touch.id,
      box: touch.box}
  end
end
