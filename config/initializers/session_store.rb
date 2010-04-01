# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_story_session',
  :secret      => '67ce0bc22fa1828000f5f2028942f27704dc4e4a9a041bde57dfb088fbb1477ccbc1a21b5d08131ae0c9c2a3c9848ac042f53107c27e7cf0da3b756cd7551ac5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
