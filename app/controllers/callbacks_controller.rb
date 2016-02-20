class CallbacksController < ApplicationController
	def instagram
		  redirect Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
	end
end
