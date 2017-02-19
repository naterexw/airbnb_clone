module UsersHelper
  def avatar_url(user)
    # facebook.image or gavatar image
    user.image ||= gravatar_url(user.email)
  end
end
