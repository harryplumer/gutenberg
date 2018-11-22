class AddTypeToPeopleImportFile < ActiveRecord::Migration[5.1]
  def change
    add_column :people_import_files, :add_update, :string, default: "add"
  end
end
