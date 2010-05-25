# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Teste_session',
  :secret      => 'b95858ea20389096a27236baeabb884d36c3161ea8c8f388ce359c75f2ef5dfcc6bbd17b4dd613c11eb8d9789dc8546de3392c11f453d95b784c723979123daa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
