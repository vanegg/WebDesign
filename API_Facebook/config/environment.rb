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

#Requires Facebook
require 'yaml'
require 'omniauth'
require 'omniauth-facebook' # Facebook authentication
require 'koala'             # Facebook API

require 'json'

APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Configura los controllers y los helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'uploaders', '*.rb')].each { |file| require file }

# Configura la base de datos y modelos 
require APP_ROOT.join('config', 'database')

# Lee las keys de facebook.yml y las guarda como variables del ENV
env_config = YAML.load_file(APP_ROOT.join('config', 'facebook.yml'))
env_config.each do |key, value|
ENV[key] = value
end

def facebook_permissions
# Aquí van los permisos de tu aplicación, fíjate en qué formato tienen que ir.
'publish_actions, public_profile, user_about_me, user_friends, user_birthday, user_photos, user_posts, user_relationships'
end

# Configura el omniauth-facebook y se agrega OmniAuth a Rack middleware y configuramos facebook como provider
use OmniAuth::Builder do
provider :facebook, ENV['APP_ID'], ENV['SECRET'],
         :scope => facebook_permissions,
         :display => 'popup'
end
