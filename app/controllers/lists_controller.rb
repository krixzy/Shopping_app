class ListsController < ApplicationController
  def index
    @lists = List.where(user_id: session[:user_id])
  end
  
  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @items = Item.where(list_id: @list.id)
  end

  def create
    @list = List.new(list_params)
    @list.user_id = session[:user_id]
  
    if @list.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to list_index_path, notice: 'Item was successfully created.' } # Opdateret sti
      end
    else
      flash[:notice] = "Navn allerede i brug"
      render 'new'
    end
  end
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  def update
  end

  private
  def list_params
    params.require(:list).permit(:name, :user_id)
  end
end
