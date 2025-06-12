defmodule DjrDashboard.Issue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "issues" do
    field :number, :string
    field :year, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(issue, attrs) do
    issue
    |> cast(attrs, [:number, :year])
    |> validate_required([:number, :year])
  end
end
