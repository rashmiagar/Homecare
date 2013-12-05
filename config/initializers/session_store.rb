# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_LoggerApp_session',
  :secret      => '553087d6955f79370f12e7cb7666dc2281c70988ebb249d3a7f2dbd3fabb3363463735587176e0ea39d54b70961180110fa4b0db4a87b1da52df9390767e0daa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
