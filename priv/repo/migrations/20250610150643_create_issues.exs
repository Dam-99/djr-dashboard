defmodule DjrDashboard.Repo.Migrations.CreateIssues do
  use Ecto.Migration

  def change do
    create table(:issues, primary_key: false) do
      # You can also use the migration_primary_key option to configure Repo to
      # always use a UUID primary key.
      # See https://hexdocs.pm/ecto_sql/Ecto.Migration.html#module-migrations-configuration
      # for more information.
      # By default, Ecto uses an auto-incrementing integer primary key.
      # If you want to use a UUID primary key, you can use the `:uuid` type.
      # This way you don't have to manually specify a :id primary key of type
      # UUID for each table. Ecto will be configured to generate the correct
      # primary key for each table.
      # This helps in being consistent, otherwise you might end up with some
      # tables using :id as UUID and others using :id as integer (see :issues table vs :chapters table)
      add :id, :uuid, primary_key: true

      add :number, :string # Is is a number or a string :-P
      add :year, :integer

      timestamps(type: :utc_datetime)
    end

    create index(:issues, :year)
    create unique_index(:issues, [:year, :number])
  end
end
