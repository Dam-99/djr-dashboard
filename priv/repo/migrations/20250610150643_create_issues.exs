defmodule DjrDashboard.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues) do
      add :number, :string, null: false
      add :year, :integer, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:issues, :year)
    create unique_index(:issues, [:year, :number])
  end
end
