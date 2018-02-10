# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_peac_session'

# Uncomment if in development ActionDispatch::Cookies::CookieOverflow
# Also uncomment /config/environments/development.rb
# Also use MemCached in production
# Rails.application.config.session_store :cache_store