class ListsController < SessionController
  def index
    @lists = List.where(user_id: session[:user_id])
  end
  
  def new
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @sublists = Sublist.where(list_id: params[:id])
  end

  def create
    @list = List.new(list_params)
    @list.user_id = session[:user_id]
  
    if @list.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to list_index_path, notice: 'Item was successfully created.' }
      end
    else
      flash[:notice] = "Navn allerede i brug"
      redirect_to new_list_path
    end
  end
  def destroy
    @list = List.find(params[:id])
    # remove_sublist(@list.id)
    @list.destroy
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@list)
      end
      format.html { redirect_to list_index_path, notice: 'List was successfully destroyed.' }
    end
  end

  def update
  end

  private
  def remove_sublist(list_id)
    Sublist.where(list_id: list_id).delete_all
    
  end


  def list_params
    params.require(:list).permit(:name, :user_id)
  end
end
