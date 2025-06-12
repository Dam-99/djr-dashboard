defmodule DjrDashboard.Repo.Migrations.CreateMangaChapReviews do
  use Ecto.Migration

  def change do
    create table(:manga_chap_reviews) do
      add :chapter, :integer
      add :message, :text
      add :issue_number, references(:issues, on_delete: :nothing)
      add :issue_year, references(:issues, on_delete: :nothing)
      add :manga_uuid, references(:mangas, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    # idk if indexes like this is better, or how i did it
    create index(:manga_chap_reviews, [:manga_uuid])
    create index(:manga_chap_reviews, [:issue_number])
    create index(:manga_chap_reviews, [:issue_year])
  end
end
