defmodule DjrDashboard.Repo.Migrations.CreateChapterReviews do
  use Ecto.Migration

  def change do
    create table(:chapter_reviews) do
      add :message, :text
      add :chapter_id, references(:chapters, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:chapter_reviews, [:chapter_id])
  end
end
