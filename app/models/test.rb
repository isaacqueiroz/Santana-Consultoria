class Test < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  belongs_to :user
end
