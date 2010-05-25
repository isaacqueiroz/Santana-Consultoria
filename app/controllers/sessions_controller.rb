# This controller handles the login/logout function of the site.  
  class SessionsController < ApplicationController
  include AuthenticatedSystem
  layout 'application'
  before_filter :login_required, :only => :destroy
  # render new.rhtml
  def new
  end
	
  def create
    password_authentication(params[:login], params[:password])
  end
 
  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "Logout concluido com sucesso."
		redirect_to login_path    
  end

	protected
	
  def password_authentication(login, password)
    user = User.authenticate(login, password)
    if user == nil
      failed_login("Usuário e senha incorretos.")
    elsif user.activated_at.blank? 
      failed_login("Sua conta não foi ativada. Por favor, cheque seu e-mail para pegar o código de ativação.")
    elsif user.enabled == false
      failed_login("Sua conta foi desativada.")
    else
      self.current_user = user
      successful_login
    end
  end
  
  private
  
  def failed_login(message)    
    flash.now[:error] = message
    render :action => 'new'
  end
 
  def successful_login
    if params[:remember_me] == "1"
      self.current_user.remember_me
      cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
    end
      flash[:notice] = "Logado com sucesso."
      return_to = session[:return_to]
      if return_to.nil?
        redirect_to user_path(self.current_user)
      else
        redirect_to return_to
      end
  end
	
end
