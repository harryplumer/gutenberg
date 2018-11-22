class AddDocToImportFile < ActiveRecord::Migration[5.1]
  def change
    add_attachment :import_files, :doc
  end
end
