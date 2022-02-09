class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups.all
  end

  def new
    @group = current_user.groups.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save!
      redirect_to root_path
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private 

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
