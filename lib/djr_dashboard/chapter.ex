defmodule DjrDashboard.Chapter do
  use Ecto.Schema
  import Ecto.Changeset
  alias DjrDashboard.Manga
  alias DjrDashboard.Issue

  schema "chapters" do
    field :chap_number, :integer
    # Instead of defining the foreign key fields directly (:manga_id),
    # you can use the `belongs_to` macro to create associations.
    # This will automatically create the foreign key fields for you in the
    # schema.
    belongs_to :manga, Manga
    belongs_to :issue, Issue
    # field :issue_number, :string
    # field :issue_year, :integer

    # this is what i'd like to do instead...
    # belongs_to :issue, Issue, type: Ecto.UUID
    # belongs_to :issue_num, Issue, foreign_key: :issue_number, type: :string
    # belongs_to :issue_yy, Issue, foreign_key: :issue_year, type: :integer
    # You can do the above, but it doesn't really make sense
    # because the foreign key is already defined in the Issue schema
    # and you don't need to redefine it here.
    # If you want to use the issue_number and issue_year fields
    # in the Chapter schema, you can just use the belongs_to association
    # and access them through the Issue struct.

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(chapter, attrs) do
    # We can update the changeset to cast and validate the foreign keys.
    chapter
    |> cast(attrs, [:chap_number, :manga_id, :issue_id])
    |> validate_required([:chap_number, :manga_id, :issue_id])
    |> foreign_key_constraint(:manga_id)
    |> foreign_key_constraint(:issue_id)
  end
end
