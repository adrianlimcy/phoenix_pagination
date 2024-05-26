defmodule PhoenixPagination.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PhoenixPaginationWeb.Telemetry,
      PhoenixPagination.Repo,
      {DNSCluster, query: Application.get_env(:phoenix_pagination, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PhoenixPagination.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PhoenixPagination.Finch},
      # Start a worker by calling: PhoenixPagination.Worker.start_link(arg)
      # {PhoenixPagination.Worker, arg},
      # Start to serve requests, typically the last entry
      PhoenixPaginationWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixPagination.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PhoenixPaginationWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
