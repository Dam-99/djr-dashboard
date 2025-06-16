defmodule DjrDashboard.Manga do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mangas" do
    field :title, :string
    field :uuid, Ecto.UUID, primary_key: true # does it make sense for it to be a uuid
    many_to_many :issues, DjrDashboard.Issue, join_through: DjrDashboard.Chapter

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(manga, attrs) do
    manga
    |> cast(attrs, [:uuid, :title])
    |> validate_required([:uuid, :title])
  end
end
