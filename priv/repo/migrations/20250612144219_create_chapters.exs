defmodule DjrDashboard.Repo.Migrations.CreateChapters do
  use Ecto.Migration

  def change do
    create table(:chapters) do
      add :chap_number, :integer, null: false
      add :manga_id, references(:mangas, column: :id, type: :uuid, on_delete: :nothing)
      add :issue_id, references(:issues, column: :id, type: :uuid, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end
  end
end
