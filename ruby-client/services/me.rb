module Me
  
  def get_me
    api "me"
  end
  
  def update_settings given_name: nil, family_name: nil, pronoun: nil, email_address: nil, location: nil, website: nil, bio: nil, private_account: nil, password: nil, current_password: nil, favorite_films: nil, include_in_people_section: nil, email_when_followed: nil, email_comments: nil, email_news: nil, email_rushes: nil
    params = {
      givenName: given_name, familyName: family_name, pronoun: pronoun, emailAddress: email_address, location: location, website: website, bio: bio,
      privateAccount: private_account, password: password, currentPassword: current_password, favoriteFilms: favorite_films,
      includeInPeopleSection: include_in_people_section, emailWhenFollowed: email_when_followed, emailComments: email_comments, emailNews: email_news, emailRushes: email_rushes
    }
    api "me", method: "patch", params: params
  end
  
  def validation_request
    api "me/validation-request", method: "post"
  end
  
end