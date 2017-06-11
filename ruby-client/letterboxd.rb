require_relative 'api'
require_relative 'services/auth'
require_relative 'services/comments'
require_relative 'services/contributors'
require_relative 'services/films'
require_relative 'services/lists'
require_relative 'services/log_entries'
require_relative 'services/me'
require_relative 'services/members'
require_relative 'services/search'
require_relative 'services/watchlist'

# Version 0 of the Letterboxd API
class Letterboxd 

  include API
  include Auth
  include Comments
  include Contributors
  include Films
  include Lists
  include LogEntries
  include Me
  include Members
  include Search
  include Watchlist
  
  def initialize api_base, api_key, api_secret
    @api_base = api_base
    @api_key = api_key
    @api_secret = api_secret
  end
  
end
