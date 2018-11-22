class PeopleImportFile < ApplicationRecord 
  belongs_to :person 
  belongs_to :import_file
end 