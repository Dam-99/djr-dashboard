defmodule DjrDashboard.Chapter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "chapters" do
    field :chap_number, :integer
    field :manga_id, Ecto.UUID
    field :issue_id, Ecto.UUID
    # field :issue_number, :string
    # field :issue_year, :integer

    # this is what i'd like to do instead...
    # belongs_to :issue, Issue, type: Ecto.UUID
    # belongs_to :issue_num, Issue, foreign_key: :issue_number, type: :string
    # belongs_to :issue_yy, Issue, foreign_key: :issue_year, type: :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(chapter, attrs) do
    chapter
    |> cast(attrs, [:chap_number])
    |> validate_required([:chap_number])
  end
end
