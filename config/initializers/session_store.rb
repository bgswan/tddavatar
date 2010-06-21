# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tddavatar_session',
  :secret      => '99f7b9a0aaac290e184c67c1caa4113687d66db95d3c21f76c59e49010215f4561b232c33b0b793962a6b1301dada6e53e0f7315dd17c7254cd0bea7a2d66c60'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
