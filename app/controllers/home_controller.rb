class HomeController < ApplicationController
  def index
    @emails = Email.all.order(created_at: :desc)
    @import_files = ImportFile.all.order(created_at: :desc)
    @people_emails = PeopleEmail.all.order(created_at: :desc).limit(10)
  end
end
