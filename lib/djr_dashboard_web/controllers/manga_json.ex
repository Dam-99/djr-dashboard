defmodule DjrDashboardWeb.MangaJSON do
  def index(%{mangas: mangas}) do
    %{data: mangas}
  end

  def create(%{id: id, title: title}) do
    %{created: id, title: title}
  end

  def delete(%{id: id}) do
    %{deleted: id}
  end
end
