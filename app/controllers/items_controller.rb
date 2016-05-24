class ItemsController < ApplicationController

  def index
  	@items = Item.all
  end

  def new
  	@items = Item.new
  end

  def create
   if Item.create(item_params)
	  redirect_to items_path
   else
	  render :new
   end
  end

  def edit
    @items = Item.find(params[:id])
  end

  def update
    @items = Item.find(params[:id])
    if @items.update(item_params)
        redirect_to items_path
    else
        render :edit
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to items_path
  end

  def show
  	@items = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :complete)
  end
end
