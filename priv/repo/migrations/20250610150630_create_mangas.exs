defmodule DjrDashboard.Repo.Migrations.CreateMangas do
  use Ecto.Migration

  def change do
    create table(:mangas) do
      add :title, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:mangas, [:title])
  end
end
