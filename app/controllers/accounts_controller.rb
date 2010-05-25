class AccountsController < ApplicationController
  include AuthenticatedSystem
  layout 'application'
  before_filter :login_required, :except => :show
  before_filter :not_logged_in_required, :only => :show
 
  #Activate action
  def show
    #Uncomment and change paths to have user logged in after activation - not recommended
    #self.current_user = User.find_and_activate!(params[:id])
  User.find_and_activate!(params[:id])
    flash[:notice] = "Sua conta foi ativada! Você pode fazer login agora."
    redirect_to login_path
  rescue User::ArgumentError
    flash[:notice] = 'Código de ativação não encontrado. Por favor, tente criar uma nova conta.'
    redirect_to new_user_path 
  rescue User::ActivationCodeNotFound
    flash[:notice] = 'C�digo de ativação não encontrado. Por favor, tente criar uma nova conta'
    redirect_to new_user_path
  rescue User::AlreadyActivated
    flash[:notice] = 'Sua conta já foi ativada. Você poderá fazer login a seguir.'
    redirect_to login_path
  end
 
  def edit
  end
  
  #Change password action  
  def update
  return unless request.post?
    if User.authenticate(current_user.login, params[:old_password])
      if ((params[:password] == params[:password_confirmation]) && !params[:password_confirmation].blank?)
        current_user.password_confirmation = params[:password_confirmation]
        current_user.password = params[:password]        
    if current_user.save
          flash[:notice] = "Senha alterada com sucesso."
          redirect_to root_path #profile_url(current_user.login)
        else
          flash[:error] = "Um erro ocorreu, sua senha não foi modificada."
          render :action => 'edit'
        end
      else
        flash[:error] = "A nova senha não confere com a senha de confirmação."
        @old_password = params[:old_password]
        render :action => 'edit'      
      end
    else
      flash[:error] = "Sua senha antiga está incorreta."
      render :action => 'edit'
    end 
  end
  
end
