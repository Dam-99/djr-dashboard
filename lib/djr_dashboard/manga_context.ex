defmodule DjrDashboard.MangaContext do
  @moduledoc """
  The Manga context.
  """

  import Ecto.Query, warn: false
  alias DjrDashboard.ChapterContext
  alias DjrDashboard.Repo

  alias DjrDashboard.Manga

  @doc """
  returns the list of mangas currently reviewed
  """
  def list_mangas() do
    Repo.all(Manga)
    # Repo.all(from(m in Manga, select: [m.uuid, m.title]))
  end

  def get_manga(uuid) do
    Repo.get(Manga, uuid)
  end

  def create_manga(title) do
    %Manga{}
    |> Manga.changeset(%{title: title})
    |> Repo.insert()
  end

  def delete_manga(%Manga{} = manga) do
    Repo.delete(manga)
  end

  def uuid_from_title(title) do
    Repo.get_by(Manga, title: title)
  end

  def get_or_create_manga(title) do
    case uuid_from_title(title) do
      %Manga{} = manga -> manga
      nil -> {:ok, %Manga{}} = create_manga(title)
    end
  end

  def get_latest_chapter(id) do
    ChapterContext.list_manga_chapters(id)
      |> Enum.sort()
      |> List.first(0)
  end
end
