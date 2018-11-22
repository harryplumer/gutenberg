class ImportFilesController < ApplicationController
  before_action :set_import_file, only: [:show, :edit, :update, :destroy]

  def show 
    @counts = @import_file.people_import_files.group(:add_update).count
    respond_to do |format|
      format.html
      format.json {render json: @import_file.people}
    end 
  end 

  def new 
    @import_file = ImportFile.new 
  end 

  def create 
    @import_file = ImportFile.new(import_file_params)
    if @import_file.save 
      @import_file.process
      redirect_to import_file_path(@import_file), notice: "Import file saved successfully"
    else 
      redirect_to new_import_file_path, notice: "Save failed"
    end 

  end 

  def edit

  end 

  def update 

  end 

  def destroy 

  end 

  private 
  def set_import_file
    @import_file = ImportFile.find(params[:id])
  end

  def import_file_params 
    params.require(:import_file).permit(:name, :doc)
  end 

end
