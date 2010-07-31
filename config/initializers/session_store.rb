# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_newsletter_session',
  :secret      => '060a95717762781414fb5f10c9bb8e3c48d95dd6dcbc29b069a82f0aca0bfe4d51d106dc4107450df82b4d90a233c33274bb2231fa9aa5aaac548a8de6aa2e69'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
