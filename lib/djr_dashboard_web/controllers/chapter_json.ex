defmodule DjrDashboardWeb.ChapterJSON do
  def index(%{chapters: chapters}) do
    %{data: for(chapter <- chapters, do: data(chapter))}
  end

  def create(%{id: id}) do
    %{created: id}
  end

  def delete(%{id: id}) do
    %{deleted: id}
  end

  defp data(%DjrDashboard.Chapter{} = chapter) do
    %{id: chapter.id, manga: chapter.manga_id, issue: chapter.issue_id}
  end
end
