# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_todo_session',
  :secret      => '78833edee095eb9c23f13034f3b84ff724074821dceb1e04b0ba2e02c3e3509ddd1459f13cba79935eab78bc297adef55fe0053334e5de899213816edf53245c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
