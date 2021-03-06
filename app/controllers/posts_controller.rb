class PostsController < ApplicationController
	
	before_action :find_post, only: [:show, :edit, :update, :destroy]
	def index
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
		if @post.save
			flash[:notice] = "Successfully Saved"
			redirect_to @post
		else
			flash[:notice] = "Sorry! Please Try Again"
			render 'new'
		end
	end

	def show
		
	end

	def edit
		
	end

	def update
		if @post.update post_params
			flash[:notice] = "Successfully Saved"
			redirect_to @post
		else 
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to post_path
	end

	private 
	def post_params
		params.require(:post).permit(:title, :content)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end

