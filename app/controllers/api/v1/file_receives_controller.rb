class Api::V1::FileReceivesController < Api::V1::BaseController
	def receive_file
		@file_receive = FileReceive.create(file_name: params[:file_name], folder_name: params[:folder_name], account_id: params[:account_id])
		render json: {message: "Success"}, status: 200
	end
end