class ItemsController < ApplicationController

  def index
    @item = current_user.items
    @amount_sum = current_user.items.sum(:amount)
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to :root
    else
      redirect_to :new_item, notice: 'Invalid entry'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount, :group_id)
  end
end
