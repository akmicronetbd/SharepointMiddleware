class Api::V1::FileReceivesController < Api::V1::BaseController
	def receive_file
		@file_receive = FileReceive.create(account_id: params[:account_id], document_id: params[:document_id], data: request.raw_post)
		render json: {message: "Success"}, status: 200
	end
end
