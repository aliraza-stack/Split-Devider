class EntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entry, only: [:show, :edit,:update, :destroy]
  before_action :set_group, only: [:new, :index,:edit]

  def index
    @entries = @group.entries
  end

  def show
  end

  def new
    @entry = Entry.new
  end

  def edit
  end

  def create
    
    @group = Group.find_by(id: params[:group_id])
    @entry = @group.entries.new entry_params
    @entry.user = current_user
    respond_to do |format|
      if @entry.save
        format.html { redirect_to user_group_path(current_user, @group), flash: { success: 'Entry Created Successfully'}}
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|

      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to user_groups_path(current_user,@group), notice: 'Entry was successfully destroyed.' }
    end
  end

  def calculation
    value = params[:divider]
    render :not_authorized
  end

  def not_authorized
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def set_group
    @group = current_user.groups.find_by(id: params[:group_id])
  end

  def entry_params
    params.require(:entry).permit(:name, :description, :price, :group_id)
  end   
end