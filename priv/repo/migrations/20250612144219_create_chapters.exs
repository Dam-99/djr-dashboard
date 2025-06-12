defmodule DjrDashboard.Repo.Migrations.CreateChapters do
  use Ecto.Migration

  def change do
    create table(:chapters) do
      add :chap_number, :integer
      add :manga_id, references(:mangas, on_delete: :nothing)
      add :issue_number, references(:issues, on_delete: :nothing)
      add :issue_year, references(:issues, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:chapters, [:manga_id])
    create index(:chapters, [:issue_number])
    create index(:chapters, [:issue_year])
  end
end
