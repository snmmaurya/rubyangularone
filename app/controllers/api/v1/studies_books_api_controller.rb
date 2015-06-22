class Api::V1::StudiesBooksApiController < Api::V1::BaseApiController
	def index
		render json: @json and return
	end
end	
