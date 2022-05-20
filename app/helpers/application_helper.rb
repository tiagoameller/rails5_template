module ApplicationHelper
  def home_page
    if current_user.present?
      # current_user.home_page
      root_path
    else
      new_user_session_path
    end
  end

  def alert_class(alert)
    case alert
    when 'notice'
      'success'
    when 'alert'
      'warning'
    when 'error'
      'danger'
    else
      'primary'
    end
  end
end
