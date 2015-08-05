use Mix.Config

config :logger, :console,
  level: :info,
  format: "$message
"

# disable lager output
config :lager,
  error_logger_redirect: false,
  handlers: []
