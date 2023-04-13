defmodule PhxChatgpt.Repo do
  use Ecto.Repo,
    otp_app: :phx_chatgpt,
    adapter: Ecto.Adapters.Postgres
end
