defmodule DjrDashboard.Repo.Migrations.CreateMangas do
  use Ecto.Migration

  def change do
    create table(:mangas, primary_key: false) do
      add :id, :uuid, primary_key: true
      # For fields like this one, we can specify that the field is required by
      # using the `null: false` option. This will ensure that the field cannot
      # be null in the database.
      add :title, :string

      timestamps(type: :utc_datetime)
    end

    # You probably want to have a unique index on the title
    # This will ensure that no two mangas can have the same title.
    # If you want to allow multiple mangas with the same title, you can remove this
    # line or change it to a regular index.
    # The index is anyway useful for faster lookups by title.
    create unique_index(:mangas, [:title])
  end
end
