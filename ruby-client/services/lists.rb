module Lists

  def get_lists per_page: 5, sorting_option: nil, cursor: nil, film_id: nil, member_id: nil, member_relationship: nil, include_friends: nil, where: nil, filter: nil, cloned_from: nil, tag: nil, tag_code: nil, tagger: nil, include_tagger_friends: nil
    params = {
      perPage: per_page, sort: sorting_option, cursor: cursor, film: film_id, 
      member: member_id, memberRelationship: member_relationship, includeFriends: include_friends, where: where, filter: filter, clonedFrom: cloned_from,
      tag: tag, tagCode: tag_code, tagger: tagger, includeTaggerFriends: include_tagger_friends
    }
    api "lists", params: params
  end

  def get_list list_id
    api "list/#{list_id}"
  end

  def get_list_statistics list_id
    api "list/#{list_id}/statistics"
  end

  def report_list list_id, reason: nil, message: nil
    api "list/#{list_id}/report", method: "post", params: {reason: reason, message: message}
  end

  def get_list_relationship list_id
    api "list/#{list_id}/me"
  end

  def update_list_relationship list_id, liked: nil, subscribed: nil
    api "list/#{list_id}/me", method: :patch, params: {liked: liked, subscribed: subscribed}
  end

  def get_list_entries list_id, per_page: 5, sorting_option: nil, cursor: nil, where: nil, decade: nil, year: nil, genre: nil, service: nil, member_id: nil, member_relationship: nil, include_friends: nil, tag: nil, tag_code: nil, tagger: nil, include_tagger_friends: nil
    params = {
      perPage: per_page, sort: sorting_option, cursor: cursor, 
      where: where, decade: decade, year: year, genre: genre, service: service, 
      member: member_id, memberRelationship: member_relationship, includeFriends: include_friends,
      tag: tag, tagCode: tag_code, tagger: tagger, includeTaggerFriends: include_tagger_friends
    }
    api "list/#{list_id}/entries", params: params
  end

  def create_list published: nil, name: nil, ranked: nil, description: nil, tags: nil, cloned_from: nil, entries: nil, share: nil
    params = {
      published: published, name: name, ranked: ranked, description: description, tags: tags, entries: entries, clonedFrom: cloned_from, share: share
    }
    api "lists", method: :post, params: params
  end

  def update_list list_id, published: nil, name: nil, ranked: nil, description: nil, tags: nil, films_to_remove: nil, entries: nil, share: nil
    params = {
      published: published, name: name, ranked: ranked, description: description, tags: tags, filmsToRemove: films_to_remove, entries: entries, share: share
    }
    api "list/#{list_id}", method: :patch, params: params
  end
  
  def delete_list list_id
    api "list/#{list_id}", method: :delete
  end

  def get_comments_for_list list_id, per_page: 5, sorting_option: nil, cursor: nil, include_deletions: nil
    api "list/#{list_id}/comments", params: {perPage: per_page, sort: sorting_option, cursor: cursor, includeDeletions: include_deletions}
  end

  def post_comment_for_list list_id, comment
    api "list/#{list_id}/comments", method: "post", params: {comment: comment}
  end

end
