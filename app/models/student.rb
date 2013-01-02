class Student < ActiveRecord::Base
  attr_accessible :name, :schoolreference, :form_id
    
    has_many :notes
    belongs_to :form
    
    acts_as_commentable
    
    def self.csv_header
        "Name,School Reference,Form ID".split(',')
    end

    def self.build_from_csv(row)
    # find existing customer from email or create new
        s  = Student.new
        s.attributes = {
            :name => row[1],
            :schoolreference => row[0],
            :form_id => row[2]
        }
    return s
    end

    def to_csv
        [name, schoolreference, form_id]
    end

end
