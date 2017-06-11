module Members
  def list_members per_page: 5, sorting_option: nil, cursor: nil, member_id: nil, member_relationship: nil, film_id: nil, film_relationship: nil, review_id: nil, review_relationship: nil, list_id: nil, list_relationship: nil
    api "members", params: {perPage: per_page, sort: sorting_option, cursor: cursor, 
      member: member_id, memberRelationship: member_relationship, 
      film: film_id, filmRelationship: film_relationship, 
      review: review_id, reviewRelationship: review_relationship, 
      list: list_id, listRelationship: list_relationship
    }
  end

  def list_pronouns
    api "members/pronouns"
  end
  
  def get_member_details member_id
    api "member/#{member_id}"
  end
  def get_member_activity member_id, per_page: 5, sorting_option: nil, cursor: nil, include: nil, exclude: nil, where: nil
    api "member/#{member_id}/activity", params: {perPage: per_page, sort: sorting_option, cursor: cursor, include: include, exclude: exclude, where: where}
  end
  def get_member_statistics member_id
    api "member/#{member_id}/statistics"
  end
  def get_member_relationship member_id
    api "member/#{member_id}/me"
  end
  def get_member_list_tags member_id, input: nil
    api "member/#{member_id}/list-tags-2", params: {input: input}
  end
  def get_member_log_entry_tags member_id, input: nil
    api "member/#{member_id}/log-entry-tags", params: {input: input}
  end
  def get_member_watchlist watchlist_owner_member_id, per_page: 5, sorting_option: nil, cursor: nil, member_id: nil, member_relationship: nil, include_friends: nil, year: nil, decade: nil, where: nil, genre_id: nil, service: nil, tag: nil, tag_code: nil, tagger: nil, include_tagger_friends: nil
    params = {
      perPage: per_page, sort: sorting_option, cursor: cursor,
      member: member_id, memberRelationship: member_relationship, includeFriends: include_friends,
      year: year, decade: decade, where: where, genre: genre_id, service: service,
      tag: tag, tagCode: tag_code, tagger: tagger, includeTaggerFriends: include_tagger_friends
    }
    api "member/#{watchlist_owner_member_id}/watchlist", params: params
  end
  def follow_member member_id
    api "member/#{member_id}/me", method: "patch", params: {following: true}
  end
  def unfollow_member member_id
    api "member/#{member_id}/me", method: "patch", params: {following: false}
  end
  def block_member member_id
    api "member/#{member_id}/me", method: "patch", params: {blocking: true}
  end
  def unblock_member member_id
    api "member/#{member_id}/me", method: "patch", params: {blocking: false}
  end
  def report_member member_id, reason: nil, message: nil
    api "member/#{member_id}/report", method: "post", params: {reason: reason, message: message}
  end
  

end
