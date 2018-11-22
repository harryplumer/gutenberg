class Person < ApplicationRecord
  has_many :people_emails 
  has_many :people_import_files
end
