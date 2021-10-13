class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = current_user.groups
  end

  def show
  end

  def new
    @group = Group.new
    @users = User.all
  end

  def edit
    @users = User.all
  end

  def create
    @group = current_user.groups.new group_params

    respond_to do |format|
      if @group.save
        format.html { redirect_to user_groups_path(current_user), flash: { success: 'Group Created Successfully'}}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|

      if @group.update(group_params)
        format.html { redirect_to user_groups_path(current_user), notice: 'Group was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @group.destroy
    respond_to do |format|
      format.html { redirect_to user_groups_path(current_user), notice: 'Group was successfully destroyed.' }
    end
  end

  def add_member
    

  end

  private

  def set_group
    @group = current_user.groups.find_by(id: params[:id])
    # redirect_to not_authorized and return if @group.blank?
  end

  def group_params
    params.require(:group).permit(:group, :description)
  end   
end
