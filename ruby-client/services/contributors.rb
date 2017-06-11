module Contributors

  def get_contributor contributor_id, per_page: 5, sorting_option: nil, cursor: nil
    api "contributor/#{contributor_id}", params: {perPage: per_page, sort: sorting_option, cursor: cursor}
  end

  def get_contributions contributor_id, per_page: 5, sorting_option: nil, cursor: nil, contribution_type: nil, member_id: nil, member_relationship: nil, include_friends: nil, year: nil, decade: nil, where: nil, genre_id: nil
    params = {
      contributionType: contribution_type,
      perPage: per_page, sort: sorting_option, cursor: cursor,
      member: member_id, memberRelationship: member_relationship, includeFriends: include_friends,
      year: year, decade: decade, where: where, genre: genre_id
    }
    api "contributor/#{contributor_id}/contributions", params: params
  end

end
