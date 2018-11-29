class Person < ApplicationRecord
  has_many :people_emails 
  has_many :people_import_files

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email_address
  validates_uniqueness_of :email_address

end
