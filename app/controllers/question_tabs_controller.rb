class QuestionTabsController < ApplicationController
  
  include AuthenticatedSystem
  
  layout 'application'
  
  before_filter :get_test_tab, :check_administrator_role
  
  # GET /question_tabs
  # GET /question_tabs.xml
  def index
    @question_tabs = @test_tab.question_tabs.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @question_tabs }
    end
  end

  # GET /question_tabs/1
  # GET /question_tabs/1.xml
  def show
    @question_tab = @test_tab.question_tabs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @question_tab }
    end
  end

  # GET /question_tabs/new
  # GET /question_tabs/new.xml
  def new
    @question_tab = @test_tab.question_tabs.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @question_tab }
    end
  end

  # GET /question_tabs/1/edit
  def edit
    @question_tab = @test_tab.question_tabs.find(params[:id])
  end

  # POST /question_tabs
  # POST /question_tabs.xml
  def create
    @question_tab = @test_tab.question_tabs.new(params[:question_tab])

    respond_to do |format|
      if @question_tab.save
        flash[:notice] = 'Questão elaborada com sucesso.'
        format.html { redirect_to([@test_tab,@question_tab]) }
        format.xml  { render :xml => @question_tab, :status => :created, :location => @question_tab }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @question_tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /question_tabs/1
  # PUT /question_tabs/1.xml
  def update
    @question_tab = @test_tab.question_tabs.find(params[:id])

    respond_to do |format|
      if @question_tab.update_attributes(params[:question_tab])
        flash[:notice] = 'Questão alterada com sucesso.'
        format.html { redirect_to([@test_tab,@question_tab]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @question_tab.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /question_tabs/1
  # DELETE /question_tabs/1.xml
  def destroy
    @question_tab = @test_tab.question_tabs.find(params[:id])
    @question_tab.destroy

    respond_to do |format|
      format.html { redirect_to(question_tabs_url) }
      format.xml  { head :ok }
    end
  end  
end

private
  
  def get_test_tab
    @test_tab = TestTab.find(params[:test_tab_id])
  end

