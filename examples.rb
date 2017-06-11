#############################################################################################################
#
# Letterboxd API examples.
#
# Notes:
#
# Use the :null symbol instead of nil if you want to pass a JSON null object
#
#############################################################################################################

require 'json'
require_relative 'ruby-client/letterboxd'
require_relative 'helpers'

API_KEY = 'YOUR_KEY_HERE'
API_SECRET = 'YOUR_SECRET_HERE'

API_BASE = 'https://api.letterboxd.com/api/v0'

lbxd = Letterboxd.new API_BASE, API_KEY, API_SECRET

lbxd.login 'YOUR_USERNAME_HERE', 'YOUR_PASSWORD_HERE'
show_json lbxd.get_me

