# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: %i[index show]
end
