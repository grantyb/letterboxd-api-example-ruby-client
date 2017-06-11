module Watchlist

  def check_in_watchlist film_ids
    api "watchlist/me", params: {films: film_ids}
  end
  def add_to_watchlist film_id
    api "watchlist/me/#{film_id}", method: "post"
  end
  def remove_from_watchlist film_id
    api "watchlist/me/#{film_id}", method: "delete"
  end

end
