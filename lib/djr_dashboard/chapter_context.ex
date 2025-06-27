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
    query = from(
      c in Chapter,
      where: c.manga_id == ^manga_id,
      select: c.chap_number
    )
    case Repo.all(query) do # Repo.all_by not available in Ecto v3.12.1
      nil -> []
      something -> something
    end
  end

  def get_chapter(manga_id, issue_id) do
    Repo.get_by(Chapter, manga_id: manga_id, issue_id: issue_id)
  end

  def get_chapter(id) do
    Repo.get(Chapter, id)
  end

  def get_issue_chapters(%DjrDashboard.Issue{} = issue) do
    Repo.all(Chapter, issue_id: issue.id)
  end

  def get_issue_chapters(id_or_yrnr) do
    DjrDashboard.IssueContext.get_issue(id_or_yrnr)
    |> get_issue_chapters()
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
