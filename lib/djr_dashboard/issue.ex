defmodule DjrDashboard.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  # @primary_key false
  # would like to use composite primary key, but it's a bit of a pain:
  # https://elixirforum.com/t/does-ecto-supports-composite-foreign-keys/2466/6
  schema "issues" do
    field :number, :string, primary_key: true
    field :year, :integer, primary_key: true
    many_to_many :mangas, DjrDashboard.Manga, join_through: DjrDashboard.Chapter

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [:number, :year])
    |> validate_required([:number, :year])
  end
end
