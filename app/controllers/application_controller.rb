class ApplicationController < ActionController::Base
  #before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day])
  end
end

# ビュー（registration/new.html.erb）
# params{email: , password: ,firstname: ,....}

# application_controller
# devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
# Unpermitted parameters: :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day(1i), :birth_day(2i), :birth_day(3i)

# user.rb
# validates: .....

# DB(SQL pro)