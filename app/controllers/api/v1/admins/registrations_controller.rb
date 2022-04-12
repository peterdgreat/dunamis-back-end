# frozen_string_literal: true

class Api::V1::Admins::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def index
  #   @posts = Post.all
  #   render json: @posts
  # end

  # # POST /resource
  # def create
  #   @admin = Admin.new(admin_params)
  #   if @admin.save
  #     render json: @admin, status: :created
  #   else
  #     render json: @admin.errors, status: :unprocessable_entity
  #   end
  # end

  # private

  # def admin_params
  #   params.require(:admin).permit(:name, :email, :password, :password_confirmation)
  # end
  before_action :ensure_params_exist, only: :create
    skip_before_filter :verify_authenticity_token, :only => :create
    # sign up
    def create
      user = User.new user_params
      if user.save
        render json: {
          messages: "Sign Up Successfully",
          is_success: true,
          data: {user: user}
        }, status: :ok
      else
        render json: {
          messages: "Sign Up Failded",
          is_success: false,
          data: {}
        }, status: :unprocessable_entity
      end
    end
  
    private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
    def ensure_params_exist
      return if params[:user].present?
      render json: {
          messages: "Missing Params",
          is_success: false,
          data: {}
        }, status: :bad_request
    end
  
end
