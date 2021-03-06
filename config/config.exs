# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

config :nfl_rushing_web,
  generators: [context_app: :nfl_rushing]

# Configures the endpoint
config :nfl_rushing_web, NflRushingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "k+rNrUJRmhAfnxTt4uymeZayKj67ISJRD9hQC3NVRt/zEcz0aldgFqGnE1e0YJGb",
  render_errors: [view: NflRushingWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: NflRushing.PubSub,
  live_view: [signing_salt: "iDk1FLr1"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
