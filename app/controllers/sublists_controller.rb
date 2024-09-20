class SublistsController < ApplicationController
  def create
    @sublist = Sublist.new(sublist_params)
    @sublist.list_id = params[:list_id]
    if @sublist.save
      # respond_to do |format|
      #   format.turbo_stream
      #   format.html { redirect_to list_path(params[:list_id]), notice: 'Item was successfully created.' }
      # end
      redirect_to list_path(params[:list_id])
    else
      flash[:notice] = "Navn allerede i brug"
      redirect_to new_list_sublist_path(params[:list_id])
    end
  end

  def new
    @sublist = Sublist.new
  end

  def destroy
  end

  def update
  end

  private

  def sublist_params
    params.require(:sublist).permit(:name, :list_id)
  end

end
