class Api::V1::BaseController < ApplicationController

  # called before every action on controllers
  before_action :authorize_request
  skip_before_action :verify_authenticity_token

  private
  
  # Check for valid request token and return user
  def authorize_request
  	AuthorizeApiRequest.new(request.headers).call
  end
end