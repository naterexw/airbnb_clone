module ApplicationHelper
  def redirect_to_back
    redirect_to :back
    rescue ActionController::RedirectBackError => e
    redirect_to root_path
  end

  # Devise login/signup modal
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def resource_class
    devise_mapping.to
  end
end
