class QuestionTab < ActiveRecord::Base
  require 'paperclip'
  
  belongs_to :test_tab
  
  has_attached_file :picture
  
  validates_length_of :titulo,
    :in => 0..255
    
  validates_length_of :texto,
    :in => 0..400
end
