defmodule DjrDashboard.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  # @primary_key false
  # would like to use composite primary key, but it's a bit of a pain:
  # https://elixirforum.com/t/does-ecto-supports-composite-foreign-keys/2466/6
  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID
  schema "issues" do
    field :number, :string
    field :year, :integer
    many_to_many :mangas, DjrDashboard.Manga, join_through: DjrDashboard.Chapter

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [:id, :number, :year])
    |> validate_required([:number, :year])
  end
end
