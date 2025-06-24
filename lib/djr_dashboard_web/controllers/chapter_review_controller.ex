defmodule DjrDashboardWeb.ChapterReviewController do
  use DjrDashboardWeb, :controller

  alias DjrDashboard.ChapterReviewContext

  def index(conn, _params) do
    chapter_review_list = ChapterReviewContext.list_chapter_reviews()
    render(conn, :index, chapter_reviews: chapter_review_list)
  end

  # probably to be used by the browser pipeline
  def new(conn, _params) do
    render(conn, :new)
  end

  def create(conn, %{"chapter_id" => chapter_id, "message" => message}) do
    {:ok, %DjrDashboard.ChapterReview{id: id}} = ChapterReviewContext.create_chapter_review(chapter_id, message)
    render(conn, :create, id: id)
  end

  def delete(conn, %{"id" => id}) do
    {:ok, %DjrDashboard.ChapterReview{id: id}} = ChapterReviewContext.delete_chapter_review(id)
    render(conn, :delete, id: id)
  end
end
