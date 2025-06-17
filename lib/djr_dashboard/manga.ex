defmodule DjrDashboard.Manga do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  schema "mangas" do
    field :title, :string
    # field :id, Ecto.UUID, primary_key: true, autogenerate: true # does it make sense for it to be a uuid
    many_to_many :issues, DjrDashboard.Issue, join_through: DjrDashboard.Chapter

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(manga, attrs) do
    manga
    |> cast(attrs, [:id, :title])
    |> validate_required([:title])
  end
end
