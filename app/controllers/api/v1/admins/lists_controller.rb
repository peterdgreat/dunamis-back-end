# frozen_string_literal: true

class Api::V1::Admins::ListsController < ApplicationController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def index
    @admins = Admin.all
    render json: @admins
  end
end
