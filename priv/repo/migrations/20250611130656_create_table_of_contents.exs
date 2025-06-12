defmodule DjrDashboard.Repo.Migrations.CreateTableOfContents do
  use Ecto.Migration

  def change do
    create table(:table_of_contents, primary_key: false) do
      add :manga_uuid, :uuid, primary_key: true
      add :issue_number, :string, primary_key: true
      add :issue_year, :integer, primary_key: true

      timestamps(type: :utc_datetime)
    end

    create index(:table_of_contents, [:issue_number, :issue_year])
    create unique_index(:table_of_contents, [:manga_uuid, :issue_number, :issue_year])
  end
end
