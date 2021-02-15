class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::RoutingError, with: :render_404
  
  def after_sign_in_path_for(resource)
    events_path
  end
  
  private
  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  def render_404(exception = nil)
    if exception
      logger.info "Rendering 404: #{exception.message}"
    end
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
