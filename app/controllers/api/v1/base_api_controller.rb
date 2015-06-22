class Api::V1::BaseApiController < ApplicationController
	# before_action :parse_request, :authenticate_user_from_token!

	# def authenticate_user_from_token!
	# 	if !@json[:authorize_token]
	# 		render nothing: true, status: :unauthorized
	# 	else
	# 		# Codes
	# 	end
	# end

	# def parse_request
	# 	binding.pry
	# 	@json = {nothing: true, status: :unauthorized, api_token: :SNmMaurya}
	# 	# @json = JSON.parse(request.body.read)
	# end

	
	# private :authenticate_user_from_token!, :parse_request
end	