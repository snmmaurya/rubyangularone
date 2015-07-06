class Api::V1::BaseApiController < ApplicationController
	before_action :set_csrf_cookie_for_ng

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

	def set_csrf_cookie_for_ng
		cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
	end

	def verified_request?
    super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  end

  protected :verified_request?
	private :set_csrf_cookie_for_ng
	# private :authenticate_user_from_token!, :parse_request
end	