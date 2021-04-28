Sentry.init do |config|
  # config.dsn = 'https://b62b8db3c97045279ce88070e5a0680f@o487682.ingest.sentry.io/5735224'

  config.dsn = ENV["SENTRY_DSN"]
  config.breadcrumbs_logger = [:active_support_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
