# frozen_string_literal: true

class Api::V1::Admins::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # POST /resource/sign_in
  def create
    @admin = Admin.find_for_database_authentication(email: params[:admin][:email])
    return invalid_login_attempt unless @admin

    if @admin.valid_password?(params[:admin][:password])
      sign_in :admin, @admin
      render json: @admin
    else
      invalid_login_attempt
    end
  end

  # DELETE /resource/sign_out
  def destroy
    sign_out(:admin)
    render json: {
      message: 'Logged out'
    }
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
