defmodule DjrDashboard.Chapter do
  use Ecto.Schema
  import Ecto.Changeset
  alias DjrDashboard.Manga
  alias DjrDashboard.Issue

  # this seems to be still required because the configuration doesn't seem to
  # take effect.
  # this is true in all the schemas. need to investigate
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  schema "chapters" do
    field :chap_number, :integer
    belongs_to :manga, Manga
    belongs_to :issue, Issue

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(chapter, attrs) do
    chapter
    |> cast(attrs, [:chap_number, :manga_id, :issue_id])
    |> validate_required([:chap_number, :manga_id, :issue_id])
    |> foreign_key_constraint(:manga_id)
    |> foreign_key_constraint(:issue_id)
  end
end
