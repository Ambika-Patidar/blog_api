class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  include ActionController::MimeResponds
  respond_to :json

  def render_response(resource, status = :ok)
    render json: resource, status: status
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[full_name email password status])
  end
end
