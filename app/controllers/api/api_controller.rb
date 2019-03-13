# frozen_string_literal: true

# class api
module Api
  # class apicontroller
  class ApiController < ActionController::Base
    protect_from_forgery with: :null_session
  end
end
