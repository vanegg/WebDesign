# Hace require de los gems necesarios.
# Revisa: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?

require 'erb'
require 'twitter'
require 'oauth'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Configura los controllers y los helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }

# Configura la base de datos y modelos 
require APP_ROOT.join('config', 'database')

#Para cuando solo se quieran usar las contraseñas del usuario @vane_gga
# CLIENT = Twitter::REST::Client.new do |config|
#   config.consumer_key        = "L4l8qtLnVTKndz5XXkkq3xzGW"
#   config.consumer_secret     = "zQ6keSBNnHjnMCtuH7FAIqfFxWzTxEsZ0PTCOdVMoxBdqovLQs"
#   config.access_token        = "153303820-LzvMcWeM4SWpNPgFxbkoTM7u99uf8JS35ZQeBg3d"
#   config.access_token_secret = "ow2KkiDQHLZilDOqYI3rkmlJUKRAHTVa7hi8kkHDgSHhO"
# end

env_config = YAML.load_file(APP_ROOT.join('config', 'twitter.yaml'))

env_config.each do |key, value|
  ENV[key] = value
end