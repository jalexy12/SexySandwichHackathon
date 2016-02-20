class StaticPagesController < ApplicationController
	before_action :authenticate_user!

	def home
		@sandwiches = current_user.get_voted Sandwich		
	end
end
