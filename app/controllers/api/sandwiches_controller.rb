class Api::SandwichesController < ApplicationController
	def replace
	  @sandwich = Sandwich.find_unvoted_for(current_user).first
	  render json: @sandwich
	end
end
