class ApplicationMailer < ActionMailer::Base
  default from: 'info@summithockeycamps.com'
  layout 'mailer'

  def send_message(person_id, email_id)
    person = Person.find(person_id)
    email = Email.find(email_id)
    @string = email.message
    Person.column_names.each{|k| @string.gsub!("{{#{k.titleize}}}", person.send(k).to_s)}
    mail(to: person.email_address, subject: email.subject)
    PeopleEmail.create(person: person, email: email)
  end 
  
end
