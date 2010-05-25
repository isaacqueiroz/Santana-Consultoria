class ResultsController < ApplicationController
  
  include AuthenticatedSystem
  
  layout 'application'
  
  before_filter :check_administrator_role
  
  def test_selection
    #O admin seleciona o teste
    @user = User.find(params[:user_id])
    get_all_test_tabs
  end
  
  def test_results
    #Mostra os resultados de um user em um test.
    @user = User.find(params[:user_id])
    @hash = params[:test]
    @test_tab_id = @hash[:test_tab_id]
    get_users_questions(@user, @test_tab_id)
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
  
  def get_users_questions(user,test_tab_id)
    @test = user.tests.find_by_test_tab_id(test_tab_id)
    @questions = @test.questions.all
  end