defmodule DjrDashboard.MangaContext do
  @moduledoc """
  The Manga context.
  """

  import Ecto.Query, warn: false
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

  def delete_manga(uuid) do
    manga = get_manga(uuid)
    Repo.delete(manga)
  end

  def uuid_from_title(title) do
    Repo.one(
      from(
        m in Manga,
        where: m.title == ^title
      )
    )
  end
end
