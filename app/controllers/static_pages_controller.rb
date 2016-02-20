class StaticPagesController < ApplicationController
	before_action :authenticate_user!

	def home
		@sandwiches = Sandwich
										.all
										.select { | sandwich | !current_user.voted_for?(sandwich)}
		@sandwich1 = @sandwiches[0]
		@sandwich2 = @sandwiches[1]
	end
end
