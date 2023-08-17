class StoresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    render json: @store
  end

  def show
  end
end
