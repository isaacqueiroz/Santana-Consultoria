class Servico < ActiveRecord::Base
  
   validates_length_of :title,
    :in => 0..255
   
   validates_length_of :sub_title,
    :in => 0..255
    
   validates_length_of :body,
    :in => 6..400
end
