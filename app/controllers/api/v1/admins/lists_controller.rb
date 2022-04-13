# frozen_string_literal: true

class Api::V1::Admins::ListsController < ApplicationController
  def index
    @admins = Admin.all
    render json: @admins
  end
end
