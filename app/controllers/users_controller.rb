class UsersController < ApplicationController
  before_action :set_user, only: [:set_locale]

  def set_locale
    new_locale = params[:locale].to_sym
    return if I18n.locale == new_locale

    raise ArgumentError unless I18n.available_locales.include?(new_locale)

    if @user.update(locale: new_locale)
      I18n.locale = new_locale
      redirect_back fallback_location: root_path, notice: I18n.t('controllers.locale_changed')
    else
      redirect_back fallback_location: root_path, flash: { error: I18n.t('views.errors.cannot_change_status') }
    end
  rescue ArgumentError
    redirect_back fallback_location: root_path, flash: { error: I18n.t('errors.missing_locale') }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, flash: { error: I18n.t('controllers.not_found', model_name: User.model_name.human) }
  end
end
