class ApplicationController < ActionController::API

  def index
    response = SocialNetworks.call
    render json: response.empty? ? { error: 'no social network available' } : response
  end
end
