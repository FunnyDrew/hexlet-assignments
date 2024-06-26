class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = 'Post successefuly created'
			redirect_to post_path(@post)
		else

			flash[:failure] = 'Post not created'
			render :new
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			flash[:success] = 'Post successefuly edited'
			redirect_to post_path(@post)
		else
			flash[:failure] = 'Post not created'
			redirect_to edit_post_path(@post)
		end

	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body, :summary, :published)
	end
end
