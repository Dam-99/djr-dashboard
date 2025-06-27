defmodule DjrDashboard.IssueReviewContext do
  defmodule MangaChapterReview do
    # defstruct manga_title: nil, message: ""
    defstruct manga_title: :missing_title, message: ""
  end
  
  alias DjrDashboard.Repo
  alias DjrDashboard.{MangaContext, IssueContext, ChapterContext, ChapterReviewContext}
  alias DjrDashboard.IssueReviewContext.MangaChapterReview

  def create_issue({year, number}, chapter_reviews) when is_list(chapter_reviews) do
    # wanted to integrate this fetching in the Multi but idk
    # chapter_reviews =
    #   Enum.reduce(Multi.new(), fn {title, _mess}, multi ->
    #     Multi.update(
    #       multi, {:fetch_manga, title}, MangaContext.uuid_from_title(title)
    #     )
    #   end)
    Repo.transaction(fn ->
      {:ok, issue} = IssueContext.create_issue({year, number})
      chapter_reviews
      |> Enum.map(fn mcr -> for {key, val} <- mcr, into: %{} do {String.to_atom(key), val} end end)
      |> Enum.map(&struct(MangaChapterReview, &1))
      |> Enum.map(fn %MangaChapterReview{manga_title: title, message: message} ->
        manga = MangaContext.get_or_create_manga(title)
        {manga, message}
      end)
      # multi = Multi.new() |> Multi.insert(:create_issue, IssueContext.create_issue({year, number}) |> case do {:ok, issue} -> issue end)
      # Enum.reduce(chapter_reviews, multi, fn {%Manga{} = manga, message}, multi ->
        # issue = IssueContext.get_issue({year, number})
      |> Enum.each(fn mcr ->
        {manga, message} = mcr
        {:ok, chapter} = ChapterContext.create_chapter(manga.id, issue.id)
        ChapterReviewContext.create_chapter_review(chapter.id, message)
      end)
        # Multi.update(multi, {:create_chapter, manga.title}, ChapterContext.create_chapter(manga.id, issue.id) |> case do {:ok, chapter} -> chapter end)
        # |> Multi.update(multi, {:create_chapter_review, manga.title, {issue.year, issue.number}}, fn change ->
        #   chapter = change.create_chapter_review
        #   ChapterReviewContext.create_chapter_review(chapter.id, message)
        # end)
      # end)
      # actually feels like it shouldn't be like this because the context functions
      # modify the repo/db and i think it shouldn't, it should just create the changesets
      {:ok, issue_review} = DjrDashboard.IssueContext.get_review_for_issue(issue)
      issue_review
    end)
  end

end
