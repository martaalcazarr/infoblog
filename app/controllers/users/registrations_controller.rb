# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]  
  before_action :authenticate_user!

  def comments
    @user = current_user
    @comments = @user.comments
    render 'comments/index'
  end
  # GET /resource/sign_up
  def new
    super do |resource|
    resource.images.build
    end
  end
  
  def show
    @user = current_user
  end
  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    @user = current_user
  end
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_profile_path, notice: 'Perfil actualizado exitosamente.'
    else
      render :edit
    end
  end
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

  # protected
  private

  def sign_up_params
    params.require(:user).permit(:name, :phone, :age, :email, :password, :password_confirmation, images_attributes: [:url, :context])
  end
  
  def account_update_params
    params.require(:user).permit(:name, :phone, :age, :email, :password, :password_confirmation, :current_password, images_attributes: [:url, :context])
  end
  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :phone])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :age, :image])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
