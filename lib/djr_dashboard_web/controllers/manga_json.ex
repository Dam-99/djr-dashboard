defmodule DjrDashboardWeb.MangaJSON do
  def index(%{mangas: mangas}) do
    %{data: for(manga <- mangas, do: data(manga))}
  end

  def create(%{id: id, title: title}) do
    %{created: id, title: title}
  end

  def delete(%{id: id}) do
    %{deleted: id}
  end

  defp data(%DjrDashboard.Manga{} = manga) do
    %{id: manga.id, title: manga.title}
  end
end
