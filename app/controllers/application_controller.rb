class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery prepend: true
  around_action :switch_locale

  def switch_locale(&action)
    # locale = params[:locale] || I18n.default_locale
    locale = current_user.try(:locale) || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
