module Films

  # FILMS
  def get_films per_page: 5, sorting_option: nil, cursor: nil, member_id: nil, member_relationship: nil, include_friends: nil, year: nil, decade: nil, where: nil, genre_id: nil, service: nil, tag: nil, tag_code: nil, tagger: nil, include_tagger_friends: nil
    params = {
      perPage: per_page, sort: sorting_option, cursor: cursor,
      member: member_id, memberRelationship: member_relationship, includeFriends: include_friends,
      year: year, decade: decade, where: where, genre: genre_id, service: service,
      tag: tag, tagCode: tag_code, tagger: tagger, includeTaggerFriends: include_tagger_friends
    }
    api "films", params: params
  end
  def get_films_autocomplete input, per_page: 5, sorting_option: nil, cursor: nil
    api "films/autocomplete", params: {input: input, perPage: per_page, sort: sorting_option, cursor: cursor}
  end
  def get_film_genres
    api "films/genres"
  end
  def get_film_services
    api "films/film-services"
  end

  # FILM
  def get_film film_id
    api "film/#{film_id}"
  end
  def get_film_statistics film_id
    api "film/#{film_id}/statistics"
  end
  def get_film_availability film_id
    api "film/#{film_id}/availability"
  end
  def get_film_relationship film_id
    api "film/#{film_id}/me"
  end
  def get_film_relationships film_id, per_page: 5, sorting_option: nil, cursor: nil, member_id: nil, member_relationship: nil, film_relationship: nil
    api "film/#{film_id}/members", params: {perPage: per_page, sort: sorting_option, cursor: cursor, 
      filmRelationship: film_relationship,
      member: member_id, memberRelationship: member_relationship
    }
  end
  
  # Use rating: :null to clear the rating
  def update_film_relationship film_id, rating: nil, liked: nil, watched: nil, in_watchlist: nil
    api "film/#{film_id}/me", method: "patch", params: {rating: rating, liked: liked, watched: watched, inWatchlist: in_watchlist}
  end

  def report_film film_id, reason: nil, message: nil
    api "film/#{film_id}/report", method: "post", params: {reason: reason, message: message}
  end
end
