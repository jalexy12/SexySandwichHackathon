class CallbacksController < ApplicationController
	def connect
	  redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
	end

	def instagram
		response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL, scope: "public_content")
	  session[:access_token] = response.access_token
	  p response.access_token
	end
end
