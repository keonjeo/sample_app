class MicropostsController < ApplicationController
  before_action :logged_in_user,                       only: [:create, :destroy]
  before_action :correct_user,                         only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to current_user
    else
      @feed_items = []
      flash[:failed] = "Failed to create a Micropost!"
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = Micropost.find_by(id: params[:id])
    user = @micropost&.user
    redirect_to root_url unless current_user?(user)
    # @micropost = current_user.microposts.find_by(id: params[:id])
    # redirect_to root_url if @micropost.nil?
  end
  
end
