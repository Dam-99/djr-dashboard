defmodule DjrDashboardWeb.MangaController do
  use DjrDashboardWeb, :controller

  alias DjrDashboard.MangaContext

  def index(conn, _params) do
    # context do things
    manga_list = MangaContext.list_mangas()
    # then render function from manga_html/json
    # conn, template, assign(keyw list)
    render(conn, :index, mangas: manga_list)
  end

  # probably to be used by the browser pipeline
  def new(conn, _params) do
    # shouldn't need context here, it's only for returning the creation page
    render(conn, :new)
  end

  def create(conn, %{"title" => title}) do
    # maybe don't need the render here?
    {:ok, %DjrDashboard.Manga{id: uuid}} = MangaContext.create_manga(title)
    render(conn, :create, id: uuid, title: title)
  end

  def delete(conn, %{"id" => uuid}) do
    {:ok, %DjrDashboard.Manga{id: uuid}} = MangaContext.delete_manga(uuid)
    render(conn, :delete, id: uuid)
  end
end
