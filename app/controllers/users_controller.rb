class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at ASC')
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end
end
