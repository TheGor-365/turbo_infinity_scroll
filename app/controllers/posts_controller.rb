class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    #@pagy, @posts = pagy(Post.all, items: 10)
    @pagy, @posts = pagy_countless(Post.all, items: 10)
    # sleep 1

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show; end
  def edit; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
