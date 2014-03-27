class PostsController < ApplicationController
  
	def index
		@posts = current_user.posts.all
    @post = current_user.posts.new
	end

	def show
		@post = current_user.posts.find(params[:id])
	end

	def new
		@post = current_user.posts.new
	end

	def create
		@post = current_user.posts.create(post_params)
		redirect_to posts_path
	end

	def edit
		@post = current_user.posts.find(params[:id])
	end

	def update
		@post = current_user.posts.create(post_params)
		redirect_to @post
	end

	def destroy
		@post = current_user.posts.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end

	private

	def post_params
		params.require('post').permit(:title, :body, :post_status)
	end

end
