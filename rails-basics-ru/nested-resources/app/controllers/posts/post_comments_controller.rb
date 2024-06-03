class Posts::PostCommentsController < Posts::ApplicationController
	def new
		@post = resource_post
		@post_comment = resource_post.post_comments.build
	end
		
	def create
		@post = resource_post

		@post_comment = resource_post.post_comments.build(post_comment_params)
		if @post_comment.save
			redirect_to @post, notice: 'Comment was successfully created.'
		else
			render :new, status: :unprocessable_entity
		end
	end

	def edit
		@post_comment = PostComment.find params[:id]
	end

	def update
		@post_comment = PostComment.find params[:id]
		if @post_comment.update(post_comment_params)
			redirect_to @post_comment.post, notice: 'Comment was successfully updated.'
		else
			render :edit, status: :unprocessable_entity
		end
  	end

  	def destroy
    	@post_comment = PostComment.find params[:id]
    	@post = @post_comment.post

    	@post_comment.destroy

    	redirect_to @post, notice: 'Comment was successfully destroyed.'
  	end

	private

	def post_comment_params
		params.require(:post_comment).permit(:body)
	end
end
