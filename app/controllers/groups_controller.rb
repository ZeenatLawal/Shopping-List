class GroupsController < ApplicationController

  def index
    @group = Group.all.order('name ASC')
  end

  def show
    @group = Group.find(params[:id])
    @items = current_user.items.where('group_id =?', @group).all.order("created_at DESC")
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path
    else
      redirect_to :new_group, notice: 'Invalid entry'
    end
  end

  def destroy
    group = current_user.groups.find_by(id: params[:id])
    if group
      group.destroy
      redirect_to groups_path, notice: 'You deleted a group.'
    else
      redirect_to groups_path, alert: 'You cannot delete this group.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
