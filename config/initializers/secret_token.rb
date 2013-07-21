# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Satq::Application.config.secret_key_base = ENV['RAILS_SECRET_KEY_BASE'] || '6869a8df1655c7356d86b11a572c2d98'
