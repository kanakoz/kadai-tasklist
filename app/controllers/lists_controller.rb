class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  
  
  def index
    @lists = List.all
  end
  
  def show
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
  end
  
  def update
    
    if @list.update(list_params)
      flash[:succes] = 'タスクが正常に更新されました'
      redirect_to @list
    
    else
      flash[:danger] = 'タスクが更新されませんでした'
      render :edit
    end      
        
  end
  
  def destroy
    @list.destroy
    
    flash[:succes] = 'タスクは正常に削除されました'
    redirect_to lists_url
  end
  
  private
  
  def set_list
    @list = List.find(params[:id])
  end
  
  #Strong parameter
  def list_params
    params.require(:list).permit(:content, :title)
  end
  
  
end
