class Api::SandwichCommentsController < ApplicationController
	before_action :set_sandwich

	def index
			render json: @sandwich.comments.all, status: 200
	end

	def create
		@comment = @sandwich.comments.new(user_id: current_user.id, content: params[:content])
		if @comment.save 
			render json: @comment, status: 201
		else
			render json: { errors: @comment.errors }, status: 400
		end
	end

	private

	def set_sandwich
		@sandwich = Sandwich.find_by_id(params[:sandwich_id])
		unless @sandwich 
			render json: { error: "Sandwich not found" }, status: 404
			return
		end
	end
end
