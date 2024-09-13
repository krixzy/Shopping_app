class ListController < ApplicationController
  def index
    @list = List.find_by(user_id: session[:user_id])
  end
  def new
    @list = List.new
  end

  def show
  end

  def create
  end

  def destroy
  end

  def update
  end
end
