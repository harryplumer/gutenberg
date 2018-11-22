class PeopleEmail < ApplicationRecord 
  belongs_to :person 
  belongs_to :email
end 
