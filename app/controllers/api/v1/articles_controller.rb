class Api::V1::ArticlesController < Api::V1::ApplicationController
  def index
    render json: current_user
  end
end
