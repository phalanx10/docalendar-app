class UsersController < ApplicationController
  def edit
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end