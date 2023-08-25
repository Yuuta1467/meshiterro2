class Admin::UsersController < ApplicationController
    before_action :authenticate_admin!
  def index
    @users = User.page(params[:page]).order(created_at: :desc)
    #byebug
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.post_images.order(created_at: :desc)
    @post_comments = @user.post_comments.order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
