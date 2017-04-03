Rails.application.config.session_store :redis_store, servers: {
  host: 'localhost',
  port: 6379,
  db: 0,
  namespace: 'tictactoe_session' }, expires_in: 24.hours
