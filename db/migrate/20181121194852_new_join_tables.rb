class NewJoinTables < ActiveRecord::Migration[5.1]
  def change
    create_table :people_import_files do |t| 
      t.references :person 
      t.references :import_file 
      t.timestamps
    end 

    create_table :people_emails do |t| 
      t.references :person 
      t.references :email
      t.timestamps
    end 

  end
end
