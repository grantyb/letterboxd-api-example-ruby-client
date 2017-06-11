module Search

  def search input, per_page: 5, cursor: nil, search_method: nil, include: nil, contribution_type: nil
    params = {
      input: input, perPage: per_page, cursor: cursor,
      searchMethod: search_method, include: include, contributionType: contribution_type
    }
    api "search", params: params
  end
  
end
