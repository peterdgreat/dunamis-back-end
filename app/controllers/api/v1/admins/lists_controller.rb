# frozen_string_literal: true

class Api::V1::Admins::ListsController < ApplicationController
  def index
    @admins = Admin.all
    render json: @admins
  end

  def show
    if current_admin
      @admin = current_admin
      render json: @admin
    else
      render json: {
        error: 'You must be logged in to view this content'
      }
    end
  end
end
