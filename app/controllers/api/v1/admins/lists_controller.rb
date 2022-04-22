class Api::V1::Admins::ListsController < ApplicationController
  before_action :api_session_authenticate!
  def index
    @admins = Admin.all
    render json: @admins
  end

  def current_user
    @current_user = warden.admin
    render json: {
      messages: 'Show current admin',
      is_success: true,
      data: { user: @current_user }
    }
    puts @current_user
  end

  private

  def warden
    request.env['warden']
  end

  def api_session_authenticate!
    return not_authenicated unless authenticate
  end

  def authenticate
    warden.authenticated?
  end

  def not_authenicated
    render json: {
      messages: 'Not Authorized',
      is_success: false,
      data: {}
    }
  end
end
