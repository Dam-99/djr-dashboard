defmodule DjrDashboardWeb.IssueJSON do
  alias DjrDashboard.Issue

  def index(%{issues: issues}) do
    %{data: for(issue <- issues, do: data(issue))}
  end

  # don't think returning an issue works, use data
  def create(%{issue: %Issue{} = issue}) do
    # %{created: %Issue{year: year, number: number}}
    Map.merge( %{created: issue.id}, data(issue))
  end

  def delete(%{issue: %Issue{} = issue}) do
    %{deleted: data(issue)}
  end

  defp data(issue) when is_tuple(issue) or is_struct(issue) do
    %{id: issue.id, year: issue.year, number: issue.number}
  end
  
  defp data([year | [number | []]]) do
    %{year: year, number: number}
  end
  defp data([id | [year | [number | []]]]) do
    %{id: id, year: year, number: number}
  end
end
