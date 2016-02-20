class SandwichVotesController < ApplicationController

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
			@sandwich.downvote_from(current_user)
			render json: @sandwich.votes_for.size
		end
	end
end
