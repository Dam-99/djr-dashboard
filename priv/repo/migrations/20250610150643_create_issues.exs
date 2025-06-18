defmodule DjrDashboard.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :number, :string
      add :year, :integer

      timestamps(type: :utc_datetime)
    end

    create index(:issues, :year)
    create unique_index(:issues, [:year, :number])
  end
end
