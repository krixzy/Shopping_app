class ItemsController < SessionController
 
  def create
    
    @item = Item.new(item_params)
    @item.sublist_id = params[:sublist_id]
    if @item.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to list_index_path, notice: 'Item was successfully created.' }
      end
    else
      render :new
    end
  end

  def new
    @item = Item.new
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@item)
      end
      format.html { redirect_to list_path(@item.sublist.list_id), notice: 'Item was successfully destroyed.' }
    end
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount, :price, :sublist_id)
  end

end
