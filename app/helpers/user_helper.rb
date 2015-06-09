module UserHelper
  def get_user_name(user_id)
    return User.select("firstname").find(user_id)["firstname"]
    end
end