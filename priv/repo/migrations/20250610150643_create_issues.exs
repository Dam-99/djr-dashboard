defmodule DjrDashboard.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues, primary_key: false) do
      add :number, :string, primary_key: true
      add :year, :integer, primary_key: true

      timestamps(type: :utc_datetime)
    end
  end
end
