class TestTab < ActiveRecord::Base
  has_many :question_tabs
  
   validates_length_of :nome,
    :in => 3..255
    
   validates_length_of :descricao,
    :in => 6..400
  
  
end
