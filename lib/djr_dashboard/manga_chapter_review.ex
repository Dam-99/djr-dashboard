defmodule DjrDashboard.MangaChapterReview do
  use Ecto.Schema
  import Ecto.Changeset

  schema "manga_chap_reviews" do
    field :message, :string
    field :chapter, :integer
    field :issue_number, :id
    field :issue_year, :id
    field :manga_uuid, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(manga_chapter_review, attrs) do
    manga_chapter_review
    |> cast(attrs, [:chapter, :message])
    |> validate_required([:chapter, :message])
  end
end
