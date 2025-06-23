defmodule DjrDashboard.ChapterReview do
  use Ecto.Schema
  import Ecto.Changeset
  alias DjrDashboard.Chapter

  schema "chapter_reviews" do
    field :message, :string
    belongs_to :chapters, Chapter

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(chapter_review, attrs) do
    chapter_review
    |> cast(attrs, [:chapter_id, :message])
    |> validate_required([:chapter_id, :message])
    |> foreign_key_constraint(:chapter_id)
  end
end
