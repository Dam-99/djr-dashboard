defmodule DjrDashboard.IssueContext do
  @moduledoc """
  The Issue context.
  """

  import Ecto.Query, warn: false
  alias DjrDashboard.Repo

  alias DjrDashboard.Issue

  @doc """
  returns the list of reviewed issues
  """
  def list_issues() do
    # Repo.all(Issue)
    Repo.all(from(i in Issue, select: [i.id, i.year, i.number]))
  end

  def get_issue({year, number}) do
    Repo.one(Issue, [year: year, number: number])
  end

  def get_issue(id) do
    Repo.get(Issue, id)
  end

  def create_issue({year, number}) do
    %Issue{}
    |> Issue.changeset(%{year: year, number: number})
    |> Repo.insert(returning: [:year, :number])
  end

  def delete_issue(id_or_yrnr) do
    issue = get_issue(id_or_yrnr)
    Repo.delete(issue)
  end

  def get_review_for_issue(%Issue{} = issue) do
    chapters = DjrDashboard.ChapterContext.get_issue_chapters(issue)
    chapters
    |> Enum.map(fn %DjrDashboard.Chapter{} = chapter ->
      review = %DjrDashboard.ChapterReview{} = DjrDashboard.ChapterReviewContext.get_chapter_review(chapter.id)
      manga = DjrDashboard.MangaContext.get_manga(chapter.manga_id)
      %{manga: manga, chapter: chapter, message: review.message}
    end)
    |> IO.inspect()
    |> Enum.reduce(%{issue: issue, chapter_reviews: []}, fn mcr, acc ->
      Map.put(acc, :chapter_reviews, [mcr | acc.chapter_reviews])
    end)
  end

  def get_review_for_issue(id_or_yrnr) do
    get_issue(id_or_yrnr)
    |> get_review_for_issue()
  end
end
