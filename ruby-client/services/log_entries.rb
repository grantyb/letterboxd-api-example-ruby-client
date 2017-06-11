module LogEntries

  def get_log_entries per_page: nil, sorting_option: nil, cursor: nil, member_id: nil, member_relationship: nil, film_member_relationship: nil, include_friends: nil, film_id: nil, film_decade: nil, film_year: nil, year: nil, month: nil, week: nil, day: nil, min_rating: nil, max_rating: nil, where: nil, filter: nil, genre_id: nil, tag: nil, tag_code: nil, tagger: nil, include_tagger_friends: nil
    params = {
      perPage: per_page, sort: sorting_option, cursor: cursor, 
      member: member_id, memberRelationship: member_relationship, includeFriends: include_friends, 
      film: film_id, filmMemberRelationship: film_member_relationship, 
      filmDecade: film_decade, filmYear: film_year, genre: genre_id,
      year: year, month: month, week: week, day: day, minRating: min_rating, maxRating: max_rating, where: where, filter: filter, 
      tag: tag, tagCode: tag_code, tagger: tagger, includeTaggerFriends: include_tagger_friends
    }
    api "log-entries", params: params
  end
  def post_log_entry film_id, review_text: nil, diary_date: nil, contains_spoilers: nil, rating: nil, tags: nil, rewatch: nil, like: nil, share: nil
    review = { text: review_text, containsSpoilers: contains_spoilers, share: share } if review_text || contains_spoilers || share
    diary_details = { diaryDate: diary_date, rewatch: rewatch } if diary_date || rewatch
    params = { filmId: film_id, diaryDetails: diary_details, review: review, tags: tags, like: like, rating: rating }
    api "log-entries", method: "post", params: params
  end

  def get_log_entry lid
    api "log-entry/#{lid}"
  end
  def update_log_entry lid, review_text: nil, diary_date: nil, contains_spoilers: nil, rating: nil, tags: nil, rewatch: nil, like: nil, share: nil
    if review_text == :null
      review = :null
    elsif review_text || contains_spoilers || share
      review = { text: review_text, containsSpoilers: contains_spoilers, share: share }
    end
    if diary_date == :null
      diary_details = :null
    elsif diary_date || rewatch
      diary_details = { diaryDate: diary_date, rewatch: rewatch }
    end
    params = { diaryDetails: diary_details, review: review, tags: tags, like: like, rating: rating }
    api "log-entry/#{lid}", method: "patch", params: params
  end
  def delete_log_entry lid
    api "log-entry/#{lid}", method: "delete"
  end
  
  # Reviews
  def report_review lid, reason: nil, message: nil
    api "log-entry/#{lid}/report", method: "post", params: {reason: reason, message: message}
  end
  def get_review_statistics lid
    api "log-entry/#{lid}/statistics"
  end
  def get_comments_for_review lid, per_page: 5, sorting_option: nil, cursor: nil, include_deletions: nil
    api "log-entry/#{lid}/comments", params: {perPage: per_page, sort: sorting_option, cursor: cursor, includeDeletions: include_deletions}
  end
  def post_comment_for_review lid, comment
    api "log-entry/#{lid}/comments", method: "post", params: {comment: comment}
  end
  def get_review_relationship lid
    api "log-entry/#{lid}/me"
  end
  def update_review_relationship lid, liked: nil, subscribed: nil
    params = { liked: liked, subscribed: subscribed }
    api "log-entry/#{lid}/me", method: "patch", params: params
  end

end
