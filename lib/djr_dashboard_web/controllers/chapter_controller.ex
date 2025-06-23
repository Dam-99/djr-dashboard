defmodule DjrDashboardWeb.ChapterController do
  use DjrDashboardWeb, :controller

  alias DjrDashboard.ChapterContext

  def index(conn, _params) do
    chapter_list = ChapterContext.list_chapters()
    render(conn, :index, chapters: chapter_list)
  end

  # probably to be used by the browser pipeline
  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"manga_id" => manga_id, "issue_id" => issue_id}) do
    {:ok, %DjrDashboard.Chapter{id: id}} = ChapterContext.create_chapter(manga_id, issue_id)
    render(conn, :create, id: id)
  end

  def delete(conn, %{"id" => id}) do
    {:ok, %DjrDashboard.Chapter{id: id}} = ChapterContext.delete_chapter(id)
    render(conn, :delete, id: id)
  end
end
