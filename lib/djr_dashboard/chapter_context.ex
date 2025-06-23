defmodule DjrDashboard.ChapterContext do
  @moduledoc """
  The Chapter context.
  """

  import Ecto.Query, warn: false
  alias DjrDashboard.Repo
  alias DjrDashboard.MangaContext

  alias DjrDashboard.Chapter

  @doc """
  returns the list of chapters currently reviewed
  """
  def list_chapters() do
    Repo.all(Chapter)
  end

  def list_manga_chapters(manga_id) do
    case Repo.get_by(Chapter, manga_id: manga_id) do
      nil -> []
      something -> something
    end
  end

  def get_chapter(id) do
    Repo.get(Chapter, id)
  end

  def create_chapter(manga_id, issue_id) do
    manga_id
      |> MangaContext.get_latest_chapter()
      |> then(&(&1 + 1))
      |> create_chapter(manga_id, issue_id)
  end

  def create_chapter(chap_number, manga_id, issue_id) do
    %Chapter{}
    |> Chapter.changeset(%{chap_number: chap_number, manga_id: manga_id, issue_id: issue_id})
    |> Repo.insert()
  end

  def delete_chapter(id) do
    chapter = get_chapter(id)
    Repo.delete(chapter)
  end
end
