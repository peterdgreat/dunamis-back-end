class Api::V1::Admins::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  # sign in
  def create
    # if admin does not exist
    if @user.nil?
      render json: {
        messages: 'Invalid email or password',
        is_success: false,
        data: {}

      }, status: :unauthorized

    elsif @user.valid_password?(sign_in_params[:password])
      sign_in 'user', @user
      render json: {
        messages: 'Signed In Successfully',
        is_success: true,
        data: { user: @user }
      }, status: :ok
    else
      render json: {
        messages: 'Invalid password',
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end

  private

  def sign_in_params
    params.permit(:email, :password)
  end

  def load_user
    @user = Admin.find_for_database_authentication(email: sign_in_params[:email])
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
