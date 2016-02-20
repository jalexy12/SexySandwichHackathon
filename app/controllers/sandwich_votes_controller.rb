class SandwichVotesController < ApplicationController
	protect_from_forgery with: :null_session
	
	def upvote 
		@sandwich = Sandwich.find_by_id(params[:id])
		if !@sandwich
			render json: { error: "Sandwich not found"}, status 404
		else
			@sandwich.liked_by(current_user)
			render json: @sandwich.votes_for.size
		end
	end

	def downvote
		@sandwich = Sandwich.find_by_id(params[:id])
		if !@sandwich
			render json: { error: "Sandwich not found"}, status 404
		else
			@sandwich.disliked_by(current_user)
			render json: @sandwich.votes_for.size
		end
	end
end
