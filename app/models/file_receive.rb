require 'uri'
require 'net/http'
require 'openssl'
class FileReceive < ApplicationRecord
	after_create :act
	def act
		begin
			input_data = JSON.parse(self.data)
			@user_info = UserInformation.where(account_id: input_data["account_id"]).first
			if @user_info.nil?
				# Get access code with administrative consent
				# get_admin_consent
				# Get access_token using JWT
				# url = URI(DOCUSIGN_URL)
				# http = Net::HTTP.new(url.host, url.port)
				# http.use_ssl = true
				# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
				# req = Net::HTTP::Post.new(url)
				# basic_jwt_token = create_jwt_token(self.data)
				# Rails.logger.info "GETTING DOCUSIGN ACCESSS TOKEN"
				# Rails.logger.info "Token: --- #{basic_jwt_token}"
				# req.set_form_data("grant_type" => "urn:ietf:params:oauth:grant-type:jwt-bearer", "assertion"=> basic_jwt_token)
				# res = http.request(req)
				# Rails.logger.info "Response: #{res.inspect}"
				# case res
				# when Net::HTTPSuccess, Net::HTTPRedirection
				# 	response = JSON.parse(res.body)
				# 	@user_info = UserInformation.create(access_token: response["access_token"], token_type: response["token_type"], expires_at: Time.now+(response["expires_in"].to_i).seconds, account_id: input_data["account_id"])
				# else
				# 	Rails.logger.info res.body.inspect
				# 	res.value
				# end
				
				# GET ACCESS TOKEN USING API AUTH
				url = URI(DOCUSIGN_API_AUTH_URL)
				http = Net::HTTP.new(url.host, url.port)
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
				req = Net::HTTP::Post.new(url, 'Content-Type' => 'application/json')
				req.body = {client_id: DOCUSIGN_API_CLIENT_ID, client_secret: DOCUSIGN_API_CLIENT_SECRET}.to_json
				Rails.logger.info "GETTING DOCUSIGN ACCESSS TOKEN"
				res = http.request(req)
				Rails.logger.info "Response: #{res.inspect}"
				case res
				when Net::HTTPSuccess, Net::HTTPRedirection
					response = JSON.parse(res.body)
					@user_info = UserInformation.create(access_token: response["access_token"], token_type: response["token_type"], expires_at: Time.now+(response["expires_in"].to_i).seconds)
				else
					Rails.logger.info res.body.inspect
					res.value
				end

				# Get account id and base url
				# Rails.logger.info "GETTING DOCUSIGN ACCOUNT DETAILS"
				# url = URI(DOCUSING_USER_INFO_URL)
				# http = Net::HTTP.new(url.host, url.port)
				# http.use_ssl = true
				# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
				# request = Net::HTTP::Get.new(url)
				# request["Authorization"] = "Bearer #{@user_info.access_token}"
				# response = http.request(request)
				# case response
				# when Net::HTTPSuccess, Net::HTTPRedirection
				# 	info_response = JSON.parse(response.body)
				# 	puts info_response.inspect
				# 	@user_info.update(account_id: info_response["accounts"].first["account_id"], account_base_uri: info_response["accounts"].first["base_uri"], sub: info_response["sub"], name: info_response["name"], user_email: info_response["email"])
				# else
				# 	res.value
				# end
			end
			download_success, file = download_file(@user_info, self.data)
			puts "DDDDDDDDDDDDDDDD #{download_success}"
			sharepoint_access = get_sharepoint_access_token
			sharepoint_access = JSON.parse(sharepoint_access)
			create_folder = create_sharepoint_folder(@user_info, self.data, sharepoint_access) if download_success == true
			upload_file = upload_file(@user_info, self.data, file, sharepoint_access) if download_success == true#
		rescue Exception => e
			Rails.logger.info "Error! Couldn't process with Exception #{e.inspect}"
		end
	end

	def get_admin_consent
		output = `curl --request GET \
		--data 'redirect_uri=#{DOCUSIGN_CALLBACK_URL}'\
		--url '#{DOCUSIGN_URL}' \
		--data-urlencode 'response_type=code' \
		--data-urlencode 'scope=signature,impersonation,spring_read,spring_write' \
		--data-urlencode 'client_id=#{DOCUSIGN_CLIENT_ID}'`
	end

	def create_jwt_token(data)
		data = JSON.parse(data)
		rsa_private = OpenSSL::PKey::RSA.new(DOCUSIGN_PRIVATE_KEY)
		payload = {"iss": DOCUSIGN_CLIENT_ID, "sub": data["account_id"], "iat": Time.now.to_i, "exp": (Time.now+30.days).to_i, "aud": DOCUSIGN_AUD_URL, "scope":"signature impersonation spring_read spring_write"}
		puts payload
		token = JWT.encode payload, rsa_private, "RS256"
		return token
	end

	def download_file(user_info, file_data)
		begin
			# Rails.logger.info "DOWNLOAD FILE FROM DOCUSIGN"
			# download_success = false
			# file_data = JSON.parse(file_data)
			# uat_url = DOCUSIGN_UAT_URL+"#{DOCUSIGN_API_USER_ID}/documents/#{file_data["document_id"]}"
			# puts uat_url.inspect
			# url = URI(uat_url)
			# http = Net::HTTP.new(url.host, url.port)
			# http.use_ssl = true
			# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			# uat_request = Net::HTTP::Get.new(url)
			# uat_request["Authorization"] = "Bearer #{user_info.access_token}"
			# uat_response = http.request(uat_request)
			# puts uat_response.body.inspect
			# case uat_response
			# when Net::HTTPSuccess, Net::HTTPRedirection
			# 	file = File.open(file_data["document_name"], 'w'){|f|
			# 		uat_response.read_body
			# 	}
			# 	download_success = true
			# 	puts uat_response.inspect
			# else
			# 	uat_response.value
			# end
			Rails.logger.info "DOWNLOAD FILE FROM DOCUSIGN"
			download_success = false
			file_data = JSON.parse(file_data)
			uat_url = DOCUSIGN_UAT_URL+"/v201411/documents/#{file_data["document_id"]}"
			puts uat_url.inspect
			url = URI(uat_url)
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			uat_request = Net::HTTP::Get.new(url)
			uat_request["Authorization"] = "Bearer #{user_info.access_token}"
			uat_response = http.request(uat_request)
			puts uat_response.body.inspect
			case uat_response
			when Net::HTTPSuccess, Net::HTTPRedirection
				file = File.open(file_data["document_name"], 'w'){|f|
					uat_response.read_body
				}
				download_success = true
				puts uat_response.inspect
			else
				uat_response.value
			end
			return download_success, file
		rescue Exception => e
			Rails.logger.info "Error! Failed to download document #{e.inspect}"
		end
	end

	def upload_file(user_info, data, file, sharepoint_access)
		begin
			Rails.logger.info ">>> SHAREPOINT UPLOAD FILE"
			Rails.logger.info user_info.inspect
			Rails.logger.info data.inspect
			Rails.logger.info file.inspect
			upload_data = JSON.parse(data)
			if !sharepoint_access["access_token"].nil?
				url = URI.encode(SHAREPOINT_UPLOAD_URL+"#{upload_data["document_name"].split(".").first.to_s})/Files/Add"+"(url='#{upload_data['document_name']}',overwrite=true)")
				url = URI(url)
				http = Net::HTTP.new(url.host, url.port)
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
				up_request = Net::HTTP::Post.new(url)
				up_request["Authorization"] = "Bearer #{sharepoint_access["access_token"]}"
				form_data = [['file', file]]
				up_request.set_form form_data, 'multipart/form-data'
				up_response = http.request(up_request)
				case up_response
				when Net::HTTPSuccess, Net::HTTPRedirection
					puts up_response.inspect
					Rails.logger.info "Document upload successful"
					self.update(completed: true)
				else
					up_response.value
				end
			end
		rescue Exception => e
			Rails.logger.info "Error! Unable to upload document #{e.inspect}"
		end
	end

	def get_sharepoint_access_token
		begin
			Rails.logger.info "GETTING ACCESS TOKEN FROM SHAREPOINT"
			access_token_success = false
			url = URI(SHAREPOINT_ACCESS_URL+SHAREPOINT_ACCESS_ID+"/tokens/OAuth/2")
			http = Net::HTTP.new(url.host, url.port)
			http.use_ssl = true
			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			req = Net::HTTP::Post.new(url)
			req.set_form_data("grant_type" => "client_credentials", "client_id"=> SHAREPOINT_CLIENT_ID, "client_secret" => SHAREPOINT_CLIENT_SECRET, "resource" => SHAREPOINT_RESOURCE)
			res = http.request(req)
			case res
			when Net::HTTPSuccess, Net::HTTPRedirection
				Rails.logger.info "SHAREPOINT ACCESS SUCCESS: #{res.body.inspect}"
				res.body
			else
				Rails.logger.info "SHAREPOINT ACCESS FAILURE: #{res.inspect}"
				res.value
			end
		rescue Exception => e
			Rails.logger.info "FAILED: SHAREPOINT ACCESS: #{e.inspect}"
		end
	end

	def create_sharepoint_folder(user_info, data, sharepoint_access)
		begin
			Rails.logger.info ">>> SHAREPOINT CREATE FOLDER"
			Rails.logger.info user_info.inspect
			Rails.logger.info data.inspect
			upload_data = JSON.parse(data)
			if !sharepoint_access["access_token"].nil?
				url = URI.encode(SHAREPOINT_FOLDER_CREATE_URL)
				url = URI(url)
				http = Net::HTTP.new(url.host, url.port)
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
				create_req = Net::HTTP::Post.new(url, 'Content-Type' => 'application/json')
				create_req.body = {ServerRelativeUrl: "Contract%20Library/#{upload_data["document_name"].split(".").first.to_s}"}.to_json
				create_req["Authorization"] = "Bearer #{sharepoint_access["access_token"]}"
				create_response = http.request(create_req)
				case up_response
				when Net::HTTPSuccess, Net::HTTPRedirection
					puts up_response.inspect
					Rails.logger.info "Folder Created successfully"
				else
					Rails.logger.info "Error: During Folder Creation"
					up_response.value
				end
			end
		rescue Exception => e
			Rails.logger.info "Error! Unable to create folder #{e.inspect}"
		end
	end

	def self.start
		where(completed: true).destroy_all
		file_receives = where(completed: false)
		file_receives.each do |fr|
			fr.act
		end
	end 
end
