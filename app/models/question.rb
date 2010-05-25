class Question < ActiveRecord::Base
  belongs_to :test
  
  validates_presence_of     :resposta
end