class UsersController < ApplicationController
  def select_role
  end

  def select_store
    current_user.role = 'store'
    current_user.save
    redirect_to root_path, notice: 'you are store now!' 
  end

  def select_client
    current_user.role = 'client'
    current_user.save
    redirect_to root_path, notice: 'you are client now!'  
  end
end
