defmodule DjrDashboard.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "issues" do
    field :number, :string
    field :year, :integer
    many_to_many :issues, DjrDashboard.Manga, join_through: DjrDashboard.Chapter

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [:number, :year])
    |> validate_required([:number, :year])
  end
end
