module ApplicationHelper
  def home_page
    if current_user.present?
      # current_user.home_page
      root_path
    else
      new_user_session_path
    end
  end
end
