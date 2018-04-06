class UsersController < ApplicationController
  before_action :logged_in_user,                   only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,                     only: [:edit, :update]
  before_action :admin_user,                       only: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  USER_DEFAULT_PER_PAGE = 5
  MICROPOST_DEFAULT_PER_PAGE = 7
  FOLLOWING_DEFAULT_PER_PAGE = 7
  FOLLOWERS_DEFAULT_PER_PAGE = 7

  def index
    @users = User.activated.search(params[:email]).paginate(page: params[:page], per_page: USER_DEFAULT_PER_PAGE)
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.feed_microposts.paginate(page: params[:page], per_page: MICROPOST_DEFAULT_PER_PAGE)
    # debugger
    redirect_to root_url and return unless @user.activated?
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 处理注册成功的情况
      # log_in @user
      # flash[:success] = "Welcome to the Sample App!"
      # redirect_to @user
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_path
    else
      flash[:alert] = "Sorry! Failed to create a new account!"
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # 处理更新成功的情况
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    end
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page: FOLLOWING_DEFAULT_PER_PAGE)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page: FOLLOWERS_DEFAULT_PER_PAGE)
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # 前置过滤器
  # # 确保用户已登录
  # # This method has been moved into applications_controller.rb file
  # def logged_in_user
  #   unless logged_in?
  #     store_location
  #     flash[:danger] = "Please log in."
  #     redirect_to login_path
  #   end
  # end

  # 确保是正确的用户
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # 确保是管理员
  def admin_user
    unless current_user.admin?
      flash[:danger] = "Sorry, you have no permission to delete that user!"
      redirect_to users_url
    end
  end
end
