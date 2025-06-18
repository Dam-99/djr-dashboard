defmodule DjrDashboard.Repo.Migrations.CreateChapters do
  use Ecto.Migration

  def change do
    create table(:chapters) do
      add :chap_number, :integer
      add :manga_id, references(:mangas, column: :id, type: :uuid, on_delete: :nothing)
      add :issue_id, references(:issues, column: :id, type: :uuid, on_delete: :nothing)
      # add :issue_number, references(:issues, column: :number, type: :string, on_delete: :nothing)
      # add :issue_year, references(:issues, column: :year, type: :integer, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    # create index(:chapters, [:manga_id])
    # create unique_index(:chapters, [:manga_id, :issue_number, :issue_year])
  end
end
