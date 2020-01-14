module PostsHelper
  def create_new_user(post_params)
    user = User.new(name: post_params[:user])
    post = Post.new(name: post_params[:name], content: post_params[:content])
    post.user = user
    post.save
    post
  end

  def create_post_from_existing_user(post_params)
    user = User.find(post_params[:user_id])
    post = Post.new(name: post_params[:name], content: post_params[:content])
    post.user = user 
    if post.valid?
      post.save
      post
    end
  end
end
