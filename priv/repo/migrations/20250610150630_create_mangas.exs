defmodule DjrDashboard.Repo.Migrations.CreateMangas do
  use Ecto.Migration

  def change do
    create table(:mangas, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
