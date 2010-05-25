class TestsController < ApplicationController
  
  include AuthenticatedSystem
  
  layout 'application'
  
  before_filter :get_user, :get_all_test_tabs
  before_filter :login_required
  before_filter :check_administrator_role, :only => [:destroy, :update]
  
  # GET /tests
  # GET /tests.xml
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tests }
    end
  end

  # GET /tests/1
  # GET /tests/1.xml
  def show
    @test = @user.tests.find(params[:id])
    @test_tab = TestTab.find(@test.test_tab_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @test }
    end
  end

  # GET /tests/new
  # GET /tests/new.xml
  def new
    @test = @user.tests.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test }
    end
  end

  # GET /tests/1/edit
  def edit
    @test = Test.find(params[:id])
  end

  # POST /tests
  # POST /tests.xml
  def create
    @test = @user.tests.new(params[:test])

    respond_to do |format|
      if @test.save
        format.html { redirect_to(@test) }
        format.xml  { render :xml => @test, :status => :created, :location => @test }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tests/1
  # PUT /tests/1.xml
  def update
    @test = Test.find(params[:id])

    respond_to do |format|
      if @test.update_attributes(params[:test])
        format.html { redirect_to(@test) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.xml
  def destroy
    @test = Test.find(params[:id])
    @test.destroy

    respond_to do |format|
      format.html { redirect_to(tests_url) }
      format.xml  { head :ok }
    end
  end
end

private

  def get_all_test_tabs
    @test_tabs = Array.new
    @allow_tests = @user.allow_tests.all
    @allow_tests.each do |allow_test|
      @test_tabs = @test_tabs + TestTab.find_all_by_id(allow_test.test_tab_id)
    end
    @test_tabs = @test_tabs.map{|u|[u.nome,u.id]}
  end
  
  def get_user
    @user = current_user
  end
