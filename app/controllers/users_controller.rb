class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    # debugger
  end

  def create

    @user = User.new(user_params)
    if @user.save
      # 处理注册成功的情况
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      flash[:alert] = "Sorry! Failed to create a new account!"
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
