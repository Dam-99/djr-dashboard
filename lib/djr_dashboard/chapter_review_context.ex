defmodule DjrDashboard.ChapterReviewContext do
  @moduledoc """
  The ChapterReview context.
  """

  import Ecto.Query, warn: false
  alias DjrDashboard.Repo

  alias DjrDashboard.ChapterReview

  @doc """
  returns the list of chapter reviews currently reviewed
  """
  def list_chapter_reviews() do
    Repo.all(ChapterReview)
  end

  def get_chapter_review(id) do
    Repo.get(ChapterReview, id)
  end

  def create_chapter_review(chapter_id, message) do
    %ChapterReview{}
    |> ChapterReview.changeset(%{chapter_id: chapter_id, message: message})
    |> Repo.insert()
  end

  def delete_chapter_review(id) do
    chapter_review = get_chapter_review(id)
    Repo.delete(chapter_review)
  end
end
