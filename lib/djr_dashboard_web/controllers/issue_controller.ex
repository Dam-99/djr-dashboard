defmodule DjrDashboardWeb.IssueController do
  use DjrDashboardWeb, :controller

  alias DjrDashboard.IssueContext

  def index(conn, _params) do
    issue_list = IssueContext.list_issues()
    render(conn, :index, issues: issue_list)
  end

  # probably to be used by the browser pipeline
  def new(conn, _params) do
    # shouldn't need context here, it's only for returning the creation page
    render(conn, :new)
  end

  def create(conn, %{"year" => year, "number" => number}) do
    # maybe don't need the render here?
    {:ok, %DjrDashboard.Issue{} = issue} = IssueContext.create_issue({year, number})
    render(conn, :create, issue: issue)
    # render(conn, :create, year: year, number: number)
  end

  def delete(conn, %{"year" => year, "number" => number}) do
    {:ok, %DjrDashboard.Issue{} = issue} = IssueContext.delete_issue({year, number})
    render(conn, :delete, issue: issue)
  end

  def delete(conn, %{"id" => id}) do
    {:ok, %DjrDashboard.Issue{} = issue} = IssueContext.delete_issue(id)
    render(conn, :delete, issue: issue)
  end
end
