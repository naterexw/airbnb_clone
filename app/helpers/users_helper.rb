module UsersHelper
  def avatar_url(user)
    # facebook.image or gavatar image
    user.image.presence ||= gravatar_url(user.email)
  end
end
