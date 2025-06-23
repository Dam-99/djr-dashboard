defmodule DjrDashboard.Repo.Migrations.CreateMangas do
  use Ecto.Migration

  def change do
    create table(:mangas, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:mangas, [:title])
  end
end
