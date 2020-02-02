class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  check_authorization unless: :devise_controller?

  respond_to :json
end
