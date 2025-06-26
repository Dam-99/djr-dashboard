defmodule DjrDashboard.IssueContext do
  @moduledoc """
  The Issue context.
  """

  import Ecto.Query, warn: false
  alias DjrDashboard.Repo

  alias DjrDashboard.Issue

  @doc """
  returns the list of reviewed issues
  """
  def list_issues() do
    # Repo.all(Issue)
    Repo.all(from(i in Issue, select: [i.id, i.year, i.number]))
  end

  def get_issue({year, number}) do
    Repo.one(Issue, [year: year, number: number])
  end

  def get_issue(id) do
    Repo.get(Issue, id)
  end

  def create_issue({year, number}) do
    %Issue{}
    |> Issue.changeset(%{year: year, number: number})
    |> Repo.insert(returning: [:year, :number])
  end

  def delete_issue(id_or_yrnr) do
    issue = get_issue(id_or_yrnr)
    Repo.delete(issue)
  end
end
