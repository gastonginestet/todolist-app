module Api
  class ApiController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def handle_record_not_found
      render json: { error: 'Resource not found' }, status: :not_found
    end
  end
end
