module UsersHelper

  def avatar_url(user)
    # if facebook.image
    if user.image
      user.image
    # else gravatar.image
    else
      gravatar_url(current_user.email)
    end
  end

end
