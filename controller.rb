# basic requirement here...
require 'sinatra'

# Includes the module from the other file so it can be executed here.
require_relative 'models/vigenere.rb'
include Encryption

get '/' do
	erb :index
end

post '/encrypt' do
	words = params[:words]
	key = params[:key]
	@encrypted = Encryption.encrypt(words, key)
	erb :result
end

post '/decryption' do
	erb :decryption
end

post '/decrypt' do
	words = params[:words]
	key = params[:key]
	@decrypted = Encryption.decrypt(words, key)
	erb :decrypt
end