# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!
  before_action :user_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
    sign_in @user
    redirect_to select_role_path 
   else
    flash.now[:alert] = 'check field'
    render :new
   end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  private

  # If you have extra params to permit, append them to the sanitizer.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
end
