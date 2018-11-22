class PeopleEmailsControllerController < ApplicationController
  def setup_queue
    @emails = Email.all 
    @import_files = ImportFile.all 
  end 

  def queue_messages
    email = Email.find(params["email"])
    import_file = ImportFile.find(params["import_file"])
    people = import_file.people.pluck(:id)
    people.each{|p_id| ApplicationMailer.send_message(p_id, email.id).deliver_later}
    redirect_to home_index_path, notice: "Your messages have been queued for delivery."
  end 
  
end
