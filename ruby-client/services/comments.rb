module Comments

  def update_comment comment_id, comment: nil
    params = { comment: comment }
    api "comment/#{comment_id}", method: "patch", params: params
  end

  def delete_comment comment_id
    api "comment/#{comment_id}", method: "delete"
  end
  
  def report_comment comment_id, reason: nil, message: nil
    api "comment/#{comment_id}/report", method: "post", params: {reason: reason, message: message}
  end

end
