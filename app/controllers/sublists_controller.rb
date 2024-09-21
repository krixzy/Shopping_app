class SublistsController < SessionController
  def create
    @list = List.find(params[:list_id])
    @sublist = Sublist.new(sublist_params)
    @sublist.list_id = params[:list_id]
    if @sublist.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to list_path(params[:list_id]), notice: 'Item was successfully created.' }
      end
    else
      flash[:notice] = "Navn allerede i brug"
      redirect_to new_list_sublist_path(params[:list_id])
    end
  end

  def new
    @sublist = Sublist.new
  end

  def destroy
    @sublist = Sublist.find(params[:id])
    @sublist.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@sublist)
      end
      format.html { redirect_to list_path(@sublist.list_id), notice: 'Sublist was successfully destroyed.' }
    end
  end

  def update
  end

  private

  def sublist_params
    params.require(:sublist).permit(:name, :list_id)
  end

end
