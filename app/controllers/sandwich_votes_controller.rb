class SandwichVotesController < ApplicationController
	protect_from_forgery with: :null_session

	def vote
		@sandwich = Sandwich.find_by_id(params[:sandwich_good_id])
		@sandwich2 = Sandwich.find_by_id(params[:sandwich_bad_id])

		if !@sandwich || !@sandwich2
			render json: { error: "Sandwich not found"}
		else
			@sandwich.liked_by(current_user)
			@sandwich2.disliked_by(current_user)
			render json: @sandwich.votes_for.size
		end
	end
end
