class User < ActiveRecord::Base
  attr_accessible :phone
  
  validates :phone, presence:true
  
end
