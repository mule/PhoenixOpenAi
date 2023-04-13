defmodule PhxChatgpt.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      PhxChatgptWeb.Telemetry,
      # Start the Ecto repository
      PhxChatgpt.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: PhxChatgpt.PubSub},
      # Start Finch
      {Finch, name: PhxChatgpt.Finch},
      # Start the Endpoint (http/https)
      PhxChatgptWeb.Endpoint
      # Start a worker by calling: PhxChatgpt.Worker.start_link(arg)
      # {PhxChatgpt.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhxChatgpt.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhxChatgptWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
