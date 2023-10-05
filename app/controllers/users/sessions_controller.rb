class Users::SessionsController < Devise::SessionsController
  before_action :check_role, only: [:create]

  def create
    super
  end
  
  private

  def check_role
    if user_signed_in? && current_user.role.nil?
      redirect_to select_role_path
    elsif user_signed_in?
      redirect_to root_path
    end
  end
end
