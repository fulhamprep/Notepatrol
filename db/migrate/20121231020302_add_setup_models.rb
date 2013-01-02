class AddSetupModels < ActiveRecord::Migration
 
    def change
        create_table :categories do |t|
            t.string :name
            
            t.timestamps
        end
        
        
        create_table :students do |t|
            t.string :name
            t.string :schoolreference
            t.integer :form_id
            
            t.timestamps
        end
        
        
        create_table :forms do |t|
            t.string :name
            t.integer :user_id
            t.integer :yeargroup_id
            
            t.timestamps
        end
        
        
        create_table :notes do |t|
            t.integer :student_id
            t.integer :user_id
            t.text :details
            t.integer :category_id
            
            t.timestamps
        end
        
        
        create_table :yeargroups do |t|
            t.string :name
            t.integer :numberval
            
            t.timestamps
        end
        
        
        
    end
    
    
    
end
