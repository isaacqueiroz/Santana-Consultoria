class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
  
	layout 'application'
	before_filter :not_logged_in_required, :only => [:new, :create]
	before_filter :login_required, :only => [:show, :edit, :update]
  #before_filter :login_required, :only => [:show, :edit, :update, :new]
	#before_filter :check_administrator_role, :only => [:index, :destroy, :enable]

	def index
		@users = User.find(:all)
	end

	#This show action only allows users to view their own profile
	def show
		@user = current_user
	end

	# render new.rhtml
	def new
		@user = User.new
	end

	def create
		cookies.delete :auth_token
		@user = User.new(params[:user])
		if verify_recaptcha(:message => "Você digitou o texto errado. Tente novamente")
      @user.save!
      flash[:notice] = "Obrigado por se cadastrar! Cheque seu e-mail para ativar sua conta."
      redirect_to login_path
    else
      flash[:error] = "Houve um problema com o código digitado. Digite novamente."
      render :action => 'new'
    end

	end

	def edit
		@user = current_user
	end

	def update
		@user = User.find(current_user)
		if @user.update_attributes(params[:user])
			flash[:notice] = "Usuário atualizado com sucesso."
			redirect_to :action => 'show', :id => current_user
		else
			render :action => 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user.update_attribute(:enabled, false)
			flash[:notice] = "Usuário desativado com sucesso."
		else
			flash[:error] = "Houve um problema na desativação deste usuário. Por favor, tente novamente."
		end
		redirect_to :action => 'index'
	end

	def enable
		@user = User.find(params[:id])
		if @user.update_attribute(:enabled, true)
			flash[:notice] = "Ativaçãoo de usuáo completa."
		else
			flash[:error] = "Houve um problema na ativaçãoo deste usuário. Por favor, tente novamente."
		end
		redirect_to :action => 'index'
	end


  def activate
    self.current_user = params[:activation_code].blank? ? false : User.find_by_activation_code(params[:activation_code])
    if logged_in? && !current_user.active?
      current_user.activate
      flash[:notice] = "Ativação realizada com sucesso!"
    end
    redirect_back_or_default('/')
  end

end
