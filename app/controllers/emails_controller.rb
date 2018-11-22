class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def index 
    @emails = Email.all 
  end 

  def show 
    respond_to do |format|
      format.json {render json: @email}
    end 
  end 

  def new 
    @email = Email.new 
  end 

  def create 
    @email = Email.new(email_params)
    if @email.save
      flash[:success] = "New message successfully added!"
      redirect_to home_index_path
    else
      flash[:alert] = "There was an error adding your email. Please try agian."
      render partial: "form"
    end
  end 

  def edit

  end 

  def update 
    if @email.update(email_params)
      flash[:success] = "Message successfully edited"
      redirect_to home_index_path
    else
      flash[:alert] = "There was an error editing your email. Please try agian."
      render partial: "form"
    end
  end 

  def destroy 
    @email.destroy
    flash[:success] = "Email successfully deleted"
  end 

  private
  def set_email 
    @email = Email.find(params[:id])
  end 

  def email_params 
    params.require(:email).permit(:message, :name, :subject )
  end 
end
