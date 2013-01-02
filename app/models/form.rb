class Form < ActiveRecord::Base
    attr_accessible :name, :user_id, :yeargroup_id
    
    # extend FriendlyId
    #friendly_id :name, use: :slugged
    
    belongs_to :user
    belongs_to :yeargroup
    
    has_many :students
    has_many :notes, :through => :students
end
