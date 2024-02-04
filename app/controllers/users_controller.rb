class UsersController < ApplicationController
  before_action :set_user  , only: [:edit, :update, :destroy]
  
  def index
    @users = User.all  
  end
  
    def edit
  end
  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'Ο χρήστης τροποποιήθηκε...' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    #Owner cannot be deleted plus a manager should not be able to delete himself 

    @user.destroy
  
    flash[:notice] = "Ο χρήστης διαγράφηκε..."
    redirect_to users_path

  end

  def user_params
    params.require(:user).permit(:role)  
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
end