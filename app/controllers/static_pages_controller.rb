class StaticPagesController < ApplicationController
	before_action :authenticate_user!

	def home
		@sandwiches = Sandwich.find_unvoted_for(current_user)
		@sandwich1 = @sandwiches[0]
		@sandwich2 = @sandwiches[1]
	end
end
