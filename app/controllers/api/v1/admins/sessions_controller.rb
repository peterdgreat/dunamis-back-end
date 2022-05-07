class Api::V1::Admins::SessionsController < Devise::SessionsController
  respond_to :json
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
    # elsif @user.valid_password?(sign_in_params[:password])
    #   sign_in 'user', @user
    #   render json: {
    #     messages: 'Signed In Successfully',
    #     is_success: true,
    #     data: { user: @user }
    #   }, status: :ok

    elsif @user.valid_password?(sign_in_params[:password])
      resource = warden.authenticate(auth_options)
      sign_in(@user, resource)
      render json: {
        messages: 'Sign in successfully',
        is_success: true,
        data: { user: @user }
      }, status: :ok

      # puts current_admin
    else
      render json: {
        messages: 'Invalid password',
        is_success: false,
        data: {}
      }, status: :unauthorized
    end
  end

  def current_admin
    @current_admin = Admin.first
    render json: @current_admin
  end

  def destroy
    sign_out(@user)
    render json: {
      messages: 'Signed Out Successfully',
      is_success: true,
      data: {}

    }, status: :ok
  end

  private

  def sign_in_params
    # permit as json
    params.permit(:email, :password)
  end

  def load_user
    @user = Admin.find_for_database_authentication(email: sign_in_params[:email])
  end

  def auth_options
    { scope: resource_name, recall: "#{controller_path}#failure" }
  end

  def to_json(resource)
    resource.as_json(only: %i[email created_at updated_at])
  end

  # DELETE /resource/sign_out

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
