class AllowTestsController < ApplicationController
  
  include AuthenticatedSystem
  
  layout 'application'
  
  before_filter :check_administrator_role
  
  # GET /allow_tests
  # GET /allow_tests.xml
  def index
    #Todos os usuários e suas autorizações
    @users = User.find(:all)


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @allow_tests }
    end
  end

  # GET /allow_tests/1
  # GET /allow_tests/1.xml
  def show
    #Todas as autorizações de um usuário
    @user = User.find(params[:user_id])
    @allow_tests = @user.allow_tests.find(:all)
    @test_tabs = TestTab.all

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @allow_test }
    end
  end

  # GET /allow_tests/new
  # GET /allow_tests/new.xml
  def new
    @user = User.find(params[:user_id])
    @allow_test = @user.allow_tests.new
    get_all_test_tabs
  end

  # GET /allow_tests/1/edit
  def edit
    @allow_test = AllowTest.find(params[:id])
  end

  # POST /allow_tests
  # POST /allow_tests.xml
  def create
    @user = User.find(params[:user_id])
    @allow_test = @user.allow_tests.new(params[:allow_test])
    respond_to do |format|
      if @allow_test.save
        flash[:notice] = 'Autorização criada com sucesso!'
        format.html { redirect_to(:action => "index") }
        format.xml  { render :xml => @allow_test, :status => :created, :location => @allow_test }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @allow_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /allow_tests/1
  # PUT /allow_tests/1.xml
  def update
    @allow_test = AllowTest.find(params[:id])

    respond_to do |format|
      if @allow_test.update_attributes(params[:allow_test])
        format.html { redirect_to(@allow_test) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @allow_test.errors, :status => :unprocessable_entity }
      end
    end
  end

  def results
    @user = params[:user_id]
    get_all_user_test_tabs    
  end
  
  # DELETE /allow_tests/1
  # DELETE /allow_tests/1.xml
  def destroy
    @allow_test = AllowTest.find(params[:id])
    @allow_test.destroy

    respond_to do |format|
      format.html { redirect_to(:action => "index") }
      format.xml  { head :ok }
    end
  end
end

private

  def get_all_test_tabs
      @test_tabs = TestTab.all.map{|u|[u.nome,u.id]}
  end

  def get_all_user_test_tabs
    @test_tabs = Array.new
    @allow_tests = User.find(params[:user_id]).allow_tests.all
    @allow_tests.each do |allow_test|
      @test_tabs = @test_tabs + TestTab.find_all_by_id(allow_test.test_tab_id)
    end
    @test_tabs = @test_tabs.map{|u|[u.nome,u.id]}
  end