module UserHelper
  def get_user_name(user_id)
    return User.select("first_name").find(user_id)["first_name"]
  end

  def getUserNameById(user_id)
    user = User.find(user_id)
    return user.first_name + " " + user.last_name
  end

  def getUserEmailById(user_id)
    user = User.find(user_id)
    return user.email
  end

end