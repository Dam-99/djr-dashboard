# This migration is run before the one that creates the chapters table,
# so we can reference the chapters table in the foreign key constraint.

# The `on_delete: :nothing` option means that if a chapter is deleted,
# the corresponding chapter reviews will not be deleted automatically.
# If you want to delete the reviews when a chapter is deleted, you can change it to
# `on_delete: :delete_all`.
# If you want to set the foreign key to `null` when a chapter is deleted,
# you can change it to `on_delete: :nilify_all`.
# If you want to enforce that a chapter cannot be deleted if it has reviews,
# you can change it to `on_delete: :restrict`.
defmodule DjrDashboard.Repo.Migrations.CreateChapterReviews do
  use Ecto.Migration

  def change do
    create table(:chapter_reviews) do
      add :message, :text, null: false
      add :chapter_id, references(:chapters, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:chapter_reviews, [:chapter_id])
  end
end
