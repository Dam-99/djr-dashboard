defmodule DjrDashboard.Chapter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chapters" do
    field :chap_number, :integer
    field :manga_id, :id
    field :issue_number, :id
    field :issue_year, :id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(chapter, attrs) do
    chapter
    |> cast(attrs, [:chap_number])
    |> validate_required([:chap_number])
  end
end
