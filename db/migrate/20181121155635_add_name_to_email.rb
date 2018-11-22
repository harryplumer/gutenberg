class AddNameToEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :emails, :name, :string
    add_column :emails, :subject, :string
  end
end
