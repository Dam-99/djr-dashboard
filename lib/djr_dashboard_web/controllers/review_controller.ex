defmodule DjrDashboardWeb.ReviewController do
  use DjrDashboardWeb, :controller

  alias DjrDashboard.IssueReviewContext
  alias DjrDashboard.Issue
  
  def new(conn, _) do
    
  end

  def create(conn, %{"year" => year, "number" => number, "manga_chapter_reviews" => manga_chapter_reviews}) when is_list(manga_chapter_reviews) do
    %Issue{id: id} = IssueReviewContext.create_issue({year, number}, manga_chapter_reviews)
    render(conn, id: id)
  end

  def delete(conn, _) do
    
  end
end
