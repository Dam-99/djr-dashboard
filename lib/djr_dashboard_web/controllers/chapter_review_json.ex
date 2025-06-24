defmodule DjrDashboardWeb.ChapterReviewJSON do
  def index(%{chapter_reviews: chapter_reviews}) do
    %{data: for(chapter_review <- chapter_reviews, do: data(chapter_review))}
  end

  def create(%{id: id}) do
    %{created: id}
  end

  def delete(%{id: id}) do
    %{deleted: id}
  end

  defp data(%DjrDashboard.ChapterReview{} = chapter_review) do
    %{id: chapter_review.id, chapter_id: chapter_review.chapter_id}
  end
end
