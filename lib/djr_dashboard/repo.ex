defmodule DjrDashboard.Repo do
  use Ecto.Repo,
    otp_app: :djr_dashboard,
    adapter: Ecto.Adapters.SQLite3
end
