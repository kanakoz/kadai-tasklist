class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  
  def show
    @list = List.find(params[:id])
  end
  
  def new
    @list = List.new
  end
  
  def create
    @list = List.new(list_params)
    
    if @list.save
      flash[:succes] = 'タスクが正常に作成されました'
      redirect_to @list
      
    else 
      flash[:danger] = 'タスクが作成できませんでした'
      render :new
    end
      
  end
  
  def edit
    @list = List.find(params[:id])
  end
  
  def update
    @list = List.gind(params[:id])
    
    if @list.update(list_params)
      flash[:succes] = 'タスクが正常に更新されました'
      redirect_to @list
    
    else
      flash[:danger] = 'タスクが更新されませんでした'
      render :edit
    end      
        
  end
  
  def destroy
    @list = List.find(params[:id])
    @list.destroy
    
    flash[:succes] = 'タスクは正常に削除されました'
    redirect_to lists_url
  end
  
  private
  
  #Strong parameter
  def list_params
    params.require(:list).permit(:content)
  end
  
  
end
