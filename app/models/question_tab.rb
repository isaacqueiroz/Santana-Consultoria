class QuestionTab < ActiveRecord::Base
  require 'paperclip'
  
  belongs_to :test_tab
  
  has_attached_file :picture
end
