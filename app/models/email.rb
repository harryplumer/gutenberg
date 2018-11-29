class Email < ApplicationRecord
  has_many :people_emails

  validates_presence_of :name 
  validates_presence_of :subject 

  validates_uniqueness_of :name
end
