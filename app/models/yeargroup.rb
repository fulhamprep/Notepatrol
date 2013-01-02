class Yeargroup < ActiveRecord::Base
  attr_accessible :name, :numberval
    
    has_many :forms
    has_many :students, :through => :forms
    has_many :notes, :through => :students
   
    
end
