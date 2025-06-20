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

  # I guess you manually wrote these functions.
  # I suggest exploring Phoenix's generators to automate this process.
  # You can run `mix phx.gen.context MangaContext Manga mangas title:string`
  # This will create the context, schema, migration, and even a test file for you
  # with the necessary boilerplate code.
  # Other generators are available for controllers, views, etc.
  # See https://hexdocs.pm/phoenix/Mix.Tasks.Phx.Gen.html
  def delete_manga(uuid) do
    manga = get_manga(uuid)
    Repo.delete(manga)
  end

  # This returns a whole struct, not just the UUID.
  # If your purpose is to find a Manga by its title, you might want to look
  # into using `Repo.get_by/2` instead, which is more idiomatic for such cases.
  def uuid_from_title(title) do
    Repo.one(
      from(
        m in Manga,
        where: m.title == ^title
      )
    )
  end
end
