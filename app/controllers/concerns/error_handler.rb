module ErrorHandler
  extend ActiveSupport::Concern

  included do

    class Forbidden < ActionController::ActionControllerError; end
    class IpAddressRejected < ActionController::ActionControllerError; end

    rescue_from Exception, with: :rescue500
    rescue_from Forbidden, with: :rescue403
    rescue_from IpAddressRejected, with: :rescue403
    rescue_from ActiveRecord::RecordNotFound, with: :rescue404
    rescue_from ActionController::RoutingError, with: :rescue404

    def rescue500(e)
      @exception = e
      render 'errors/internal_server_error', status: 500
    end

    def rescue403(e)
      @exception = e
      render 'errors/forbidden', status: 403
    end

    def rescue404(e)
      @exception = e
      render 'errors/not_found', status: 404
    end

  end
end