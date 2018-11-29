require 'csv'

class ImportFile < ApplicationRecord

  has_many :people_import_files
  has_many :people, through: :people_import_files
   
  validates_presence_of :name
  validates_uniqueness_of :name

  has_attached_file(
    :doc,
    content_type: ['text/csv', 'application/vnd.ms-excel', 'text/plain'],
    message: "CSV only please"
  )

  validates_attachment :doc, content_type: { content_type: ['text/csv', 'application/vnd.ms-excel', 'text/plain']} , message: "CSV only please"

  def process 
    Dir.mktmpdir do |dir| 
      local_tmp_file_path = "#{dir}/#{self.doc.original_filename}"
      self.doc.copy_to_local_file(:original, local_tmp_file_path)
      
      CSV.foreach(local_tmp_file_path, headers: true, header_converters: lambda {|h| h&.parameterize&.underscore&.gsub("_", "")}).with_index(1) do |row, line| 
        line_errors = []
        h = row.to_h.with_indifferent_access
        
        first_name = h["firstname"]
        last_name = h["lastname"]
        
        if first_name.nil? || last_name.nil?
          split = h["name"].split(" ") if h.keys.include?("name")
          split = h["fullname"].split(" ") if h.keys.include?("fullname")
          first_name = split[0]
          last_name = split[1]
        end 

        email_address = h["email"]
        email_address = h["emailaddress"] if email_address.nil?

        team = h["team"]
        
        grad_year = h["year"]
        grad_year = h["gradyear"] if grad_year.nil? 
        grad_year = h["graduationyear"] if grad_year.nil?

        person = Person.find_or_create_by(email_address: email_address)
        add_update = person.id.present? ? "add" : "update"
        person.attributes = {first_name: first_name, last_name: last_name, email_address: email_address, team: team, yog: grad_year}
        if person.save
          PeopleImportFile.create(person: person, import_file: self, add_update: add_update)
        else 
          line_errors << {line: line, messages: person.errors.full_messages.join("<br>")}
        end 

      end 

    end 
  end 
end
