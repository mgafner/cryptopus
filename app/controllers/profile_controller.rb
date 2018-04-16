require 'user/api'

class ProfileController < ApplicationController
  def index
    skip_policy_scope
    @api_users = @current_user.api_users
  end
end
