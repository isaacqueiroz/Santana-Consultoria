class TestTabsController < ApplicationController
  
  include AuthenticatedSystem
  
  layout 'application'
  
  before_filter :check_administrator_role
  
  
  # GET /test_tabs
  # GET /test_tabs.xml
  def index
    @test_tabs = TestTab.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @test_tabs }
    end
  end

  # GET /test_tabs/1
  # GET /test_tabs/1.xml
  def show
    @test_tab = TestTab.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @test_tab }
    end
  end

  # GET /test_tabs/new
  # GET /test_tabs/new.xml
  def new
    @test_tab = TestTab.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test_tab }
    end
  end

  # GET /test_tabs/1/edit
  def edit
    @test_tab = TestTab.find(params[:id])
  end

  # POST /test_tabs
  # POST /test_tabs.xml
  def create
    @test_tab = TestTab.new(params[:test_tab])

    respond_to do |format|
      if @test_tab.save
        flash[:notice] = 'TestTab was successfully created.'
        format.html { redirect_to(@test_tab) }
        format.xml  { render :xml => @test_tab, :status => :created, :location => @test_tab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test_tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test_tabs/1
  # PUT /test_tabs/1.xml
  def update
    @test_tab = TestTab.find(params[:id])

    respond_to do |format|
      if @test_tab.update_attributes(params[:test_tab])
        flash[:notice] = 'TestTab was successfully updated.'
        format.html { redirect_to(@test_tab) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test_tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test_tabs/1
  # DELETE /test_tabs/1.xml
  def destroy
    @test_tab = TestTab.find(params[:id])
    @test_tab.destroy

    respond_to do |format|
      format.html { redirect_to(test_tabs_url) }
      format.xml  { head :ok }
    end
  end
end


