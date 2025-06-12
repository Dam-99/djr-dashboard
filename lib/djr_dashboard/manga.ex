defmodule DjrDashboard.Manga do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mangas" do
    field :title, :string
    field :uuid, Ecto.UUID
    many_to_many :issues, DjrDashboard.Issue, join_through: "table_of_contets"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(manga, attrs) do
    manga
    |> cast(attrs, [:uuid, :title])
    |> validate_required([:uuid, :title])
  end
end
