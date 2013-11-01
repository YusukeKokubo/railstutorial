# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = 'b8717d7a97eebca9272f15e451c92411a6915b28a979ca1d5abe4db582cb106aa7be2a92f979bf449643eb64ebd98601a856a21d20e08d3da9a1ed4c1b919a03'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist? token_file
  	File.read(token_file).chomp
  else
  	token = SecureRandom.hex(64)
  	File.write(token_file, token)
  	token
  end
end

SampleApp::Application.config.secret_key_base = secure_token
