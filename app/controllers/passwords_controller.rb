class PasswordsController < ApplicationController
  include AuthenticatedSystem
  layout 'application'
  #before_filter :not_logged_in_required, :only => [:new, :create]
  before_filter :login_required
  
  #Enter email address to recover password 
  def new
  end
 
  #Forgot password action
  def create    
    return unless request.post?
  if @user = User.find_for_forget(params[:email])
      @user.forgot_password
      @user.save      
      flash[:notice] = "Um link para reiniciar sua senha foi enviado para este e-mail."
    redirect_to login_path
    else
      flash[:notice] = "Não foi possível encontrar este e-mail. Por favor, tente novamente ou crie uma conta."
      render :action => 'new'
    end  
  end
  
  #Action triggered by clicking on the /reset_password/:id link recieved via email
  #Makes sure the id code is included
  #Checks that the id code matches a user in the database
  #Then if everything checks out, shows the password reset fields
  def edit
    if params[:id].nil?
      render :action => 'new'
      return
    end
    @user = User.find_by_password_reset_code(params[:id]) if params[:id]
    raise if @user.nil?
  rescue
    logger.error "Código de senha inválido."
    flash[:notice] = "Lamentamos, mas este código de senha é inválido. Por favor, cheque seu código e tente novamente."
    redirect_to new_user_path
  end
    
  #Reset password action /reset_password/:id
  #Checks once again that an id is included and makes sure that the password field isn't blank
  def update
    if params[:id].nil?
      render :action => 'new'
      return
    end
    if params[:password].blank?
      flash[:notice] = "O campo 'Senha' não pode estar em branco!"
      render :action => 'edit', :id => params[:id]
      return
    end
    @user = User.find_by_password_reset_code(params[:id]) if params[:id]
    raise if @user.nil?
    return if @user unless params[:password]
      if (params[:password] == params[:password_confirmation])
    @user.password_confirmation = params[:password_confirmation]
    @user.password = params[:password]
    @user.reset_password        
    flash[:notice] = @user.save ? "Senha resetada." : "Senha não resetada."
      else
        flash[:notice] = "As senhas não conferem. Verifique o campo de confirmação de senha."
        render :action => 'edit', :id => params[:id]
      return
      end  
      redirect_to login_path
  rescue
    logger.error "Código de reset inválido."
    flash[:notice] = "Lamentamos, mas este código de reset é inválido. Por favor, cheque seu código e tente novamente."
    redirect_to new_user_path
  end

end
