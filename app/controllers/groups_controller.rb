class GroupsController < ApplicationController

  def index
    @group = Group.all
  end

  def new
    @group = current_user.groups.build
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to :root
    else
      redirect_to :new_group, notice: 'Invalid entry'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
