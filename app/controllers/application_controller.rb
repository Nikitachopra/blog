class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  # before_action :authenticate_request
  #   attr_reader :current_user
    
  #   include ExceptionHandler

  #   # [...]
  #   private
  #   def authenticate_request
  #     @current_user = AuthorizeApiRequest.call(request.headers).result
  #     render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  #   end

  def after_sign_up_path_for(user)
    respond_to do |format|
      format.html {redirect_to root_path}
      format.json {render json: "created"}
    end
  end
end
