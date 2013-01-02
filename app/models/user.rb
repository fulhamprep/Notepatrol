class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  
    validates_presence_of :name
    validates_uniqueness_of :name, :email, :case_sensitive => false
    
    has_many :notes
    has_one :form
    
    
    #for bulk upload
    def self.csv_header
        "Name,email".split(',')
    end

    def self.build_from_csv(row)
        # find existing user from email or create new
        u  = User.new
        u.attributes = {
            :name => row[0],
            :email => row[1],
            :password => "monday"
        }
    return u 
    end

    def to_csv
    [name, email]
    end
end
