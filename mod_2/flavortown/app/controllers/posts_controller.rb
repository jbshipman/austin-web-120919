class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    #create new user
    #binding.pry
    if !post_params[:user].empty?
     @post = helpers.create_new_user(post_params) unless nil
     @user = @post.user unless nil
     redirect_to posts_path
   elsif !post_params[:user_id].empty?
      # use existing user from the dropdown menu
     helpers.create_post_from_existing_user(post_params)
     redirect_to posts_path
   else
     redirect_to 'new'
    end
  end

  def index
    @posts = Post.all
  end

private

  def post_params
    params.require(:post).permit(:name, :content, :user_id, :user)
  end

end
