defmodule DjrDashboardWeb.MangaController do
  use DjrDashboardWeb, :controller

  def index(conn, _params) do
    # context do things
    manga_list = MangaContext.list_manga()
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
    {:ok, uuid} = MangaContext.create_manga(title)
    render(conn, :create, id: uuid, title: title)
  end

  def delete(conn, %{"uuid" => uuid}) do
    render(conn, :delete, id: uuid)
  end

  # not sure how to do this from the page? i think i can in the :show i can send
  # the uuid in the assigns and the button keeps it in its action
  # so i wouldn't really need this action. especially because it would imply that
  # titles should also be unique which... i mean yeah, but i don't want to enforce it
  # ... or do i? could be a good chance to use the changesets, idk
  def delete(conn, %{"title" => title}) do
    uuid = MangaContext.uuid_from_title(title)
    render(conn, :delete, id: uuid)
  end
end
