class ItemsController < ApplicationController
  def index
    @item = current_user.items.includes(:group).order('created_at DESC')
    @amount_sum = current_user.items.sum(:amount)
  end

  def new
    @item = current_user.items.build
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to items_path
    else
      redirect_to :new_item, notice: 'Invalid entry'
    end
  end

  def uncategorized
    @uncategorized = current_user.items.where(group_id: nil).all.order('created_at DESC')
    @amount_sum = current_user.items.sum(:amount)
  end

  def destroy
    item = Item.find_by(id: params[:id])
    if item
      item.destroy
      redirect_to items_path, notice: 'You deleted an item.'
    else
      redirect_to items_path, alert: 'You cannot delete this item.'
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount, :group_id, :created_at)
  end
end
