class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!
  def error_404
    render_404
  end
end
