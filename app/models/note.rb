class Note < ActiveRecord::Base
  attr_accessible :category_id, :details, :student_id, :user_id
    
    belongs_to :student
    belongs_to :user
    belongs_to :category
        
    acts_as_commentable
    
end
