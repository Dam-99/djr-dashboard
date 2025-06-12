defmodule DjrDashboard.ChapterReview do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chapter_reviews" do
    field :message, :string
    field :chapter_id, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(chapter_review, attrs) do
    chapter_review
    |> cast(attrs, [:message])
    |> validate_required([:message])
  end
end
