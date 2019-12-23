class ErrorsController < ApplicationController
  def routing_error
    raise ActionController::RoutingError
  end
end
